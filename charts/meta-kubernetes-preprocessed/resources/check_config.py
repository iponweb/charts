import logging
import os
from itertools import groupby

import requests
import yaml


logging.basicConfig(format='%(levelname)s: %(message)s', level=logging.WARNING)

KUBERNETES_VERSION = 'v1.29.3'

CHART_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SCHEMA_PATH = os.path.join(CHART_ROOT, 'config', 'schema.yaml')
RESOURCES_PATH = os.path.join(CHART_ROOT, 'config', 'resources.yaml')

#: Available only starting 1.28 Kubernetes version
DISCOVERY_ROOT_URL = f"https://raw.githubusercontent.com/kubernetes/kubernetes/{KUBERNETES_VERSION}/api/discovery/"


with open(SCHEMA_PATH, 'r') as schema_file:
    SCHEMA_DATA = yaml.load(schema_file, Loader=yaml.FullLoader)

with open(RESOURCES_PATH, 'r') as resources_file:
    RESOURCES_DATA = yaml.load(resources_file, Loader=yaml.FullLoader)


ORIGINAL_DEFINITIONS = {}
for definition_url in SCHEMA_DATA['definitions']:
    definitions = requests.get(definition_url).json()
    ORIGINAL_DEFINITIONS.update(definitions)


def check_in_schema(ref):
    for rule in SCHEMA_DATA['rules']:
        if rule['source'] == ref:
            return True

    return False


def check_in_resources(name):
    return name in RESOURCES_DATA['resources']


def get_schema_original_ref(metachart_ref):
    for rule in SCHEMA_DATA['rules']:
        if rule['target'] == metachart_ref:
            return rule['source']

    return None


def get_original_definition_ref(group_version, kind):
    expected_g = '' if group_version == 'v1' else group_version.split('/')[0]
    expected_v = group_version if group_version == 'v1' else group_version.split('/')[1]

    for name, definition in ORIGINAL_DEFINITIONS['definitions'].items():
        if 'x-kubernetes-group-version-kind' in definition:
            gvk = definition['x-kubernetes-group-version-kind'][0]

            if gvk['group'] == expected_g and gvk['version'] == expected_v and gvk['kind'] == kind:
                return name


def get_resources_urls():
    APIS_URL = DISCOVERY_ROOT_URL + 'apis.json'

    apis = requests.get(APIS_URL).json()

    #: Core API
    resources_url = DISCOVERY_ROOT_URL + 'api__v1.json'
    yield resources_url

    #: Non-Core APIs
    for group_data in apis['groups']:
        group_name = group_data['name']
        group_version = group_data['preferredVersion']['version']
        resources_url = DISCOVERY_ROOT_URL + f'apis__{group_name}__{group_version}.json'

        yield resources_url


def main():
    add_to_schema = []
    add_to_resources = []

    #: Collect all resources GVK from Definitions and chart resources.yaml
    all_gvk = []
    for resources_url in get_resources_urls():
        resources_data = requests.get(resources_url).json()
        group_version = resources_data['groupVersion']
        for resource_data in resources_data['resources']:
            kind = resource_data['kind']
            name = resource_data['name']

            #: Skip nested resources
            if '/' in name:
                continue

            all_gvk.append(
                (group_version, kind, name)
            )

    for name, data in RESOURCES_DATA['resources'].items():
        #: Skip virtual resources wich not going to be rendered as template
        if not data.get('template', True):
            continue

        all_gvk.append(
            (data['apiVersion'], data['kind'], name)
        )

    for group_version, kind, name in all_gvk:
        if name not in RESOURCES_DATA['resources']:
            logging.warning(f"Resource {group_version} {name} is not enabled in the chart")

            original_ref = get_original_definition_ref(group_version, kind)
            if not original_ref:
                logging.error(f"Resource {group_version} {name} does not have definition in original schema")
            else:
                add_to_schema.append({
                    'target': 'metachart.api.' + original_ref,
                    'source': original_ref,
                    'apiVersion': group_version,
                })
                add_to_resources.append({
                    'apiVersion': group_version,
                    'kind': kind,
                    'jsonSchemaRef': 'metachart.api.' + original_ref,
                    'name': name,
                })

        else:
            resource_metachart_ref = RESOURCES_DATA['resources'][name]['jsonSchemaRef']
            original_ref = get_schema_original_ref(resource_metachart_ref)

            if not original_ref:
                logging.error(f"Resource {group_version} {name} reference is not mapped to original reference")
            else:
                original_definition = ORIGINAL_DEFINITIONS['definitions'].get(original_ref)
                if not original_definition:
                    logging.error(
                        f"Resource {group_version} {name} reference mapped to incorrect original reference")
                else:
                    gvk = original_definition.get('x-kubernetes-group-version-kind', [{}])[0]

                    expected_g = '' if group_version == 'v1' else group_version.split('/')[0]
                    expected_v = group_version if group_version == 'v1' else group_version.split('/')[1]

                    if (gvk.get('group') != expected_g
                            or gvk.get('version') != expected_v
                            or gvk.get('kind') != kind):
                        logging.error(
                            f"Resource {group_version} {name} reference mapped to incorrect original reference")

    if add_to_resources:
        print()
        print("Add to schema.yaml to support missed resources:")

        for group_version, items in groupby(add_to_schema, key=lambda x: x['apiVersion']):
            print(f"#: {group_version}")
            for item in items:
                print(f"- target: {item['target']}")
                print(f"  source: {item['source']}")
                print(f"  <<: *defaultRootKey")
            print()

        print()
        print("Add to resources.yaml to support missed resources:")
        for group_version, items in groupby(add_to_resources, key=lambda x: x['apiVersion']):
            print(f"#: {group_version}")
            for item in items:
                print(f"{item['name']}:")
                print(f"  apiVersion: {item['apiVersion']}")
                print(f"  kind: {item['kind']}")
                print(f"  jsonSchemaRef: {item['jsonSchemaRef']}")
            print()


if __name__ == '__main__':
    main()
