import json
import os

import requests
import yaml


KUBERNETES_VERSION = 'v1.28.8'

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


def gen_json_schema_def_name(group_version_uri, kind):
    if '/' in group_version_uri:
        group, version = group_version_uri.split('/')
    else:
        group, version = 'core', group_version_uri

    if group.endswith('.k8s.io'):
        group = group.rstrip('.k8s.io')

    group += '.api.k8s.io'

    group_inversed = group.split('.')
    group_inversed.reverse()

    elements = group_inversed + [version, kind]

    return '.'.join(elements)


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
    for resources_url in get_resources_urls():
        resources_data = requests.get(resources_url).json()
        group_version = resources_data['groupVersion']
        for resource_data in resources_data['resources']:
            kind = resource_data['kind']
            name = resource_data['name']

            if '/' in name:
                continue

            if name not in RESOURCES_DATA['resources']:
                print(group_version, name)
            else:
                resource_metachart_ref = RESOURCES_DATA['resources'][name]['jsonSchemaRef']
                original_ref = get_schema_original_ref(resource_metachart_ref)

                if not original_ref:
                    print('ERROR1: ' + resource_metachart_ref)
                else:
                    original_definition = ORIGINAL_DEFINITIONS['definitions'].get(original_ref)
                    if not original_definition:
                        print('ERROR2', resource_metachart_ref, original_ref)
                    else:
                        gvk = original_definition.get('x-kubernetes-group-version-kind', [{}])[0]

                        expected_g = '' if group_version == 'v1' else group_version.split('/')[0]
                        expected_v = group_version if group_version == 'v1' else group_version.split('/')[1]

                        if gvk.get('group') != expected_g or gvk.get('version') != expected_v or gvk.get('kind') != kind:
                            print('ERROR3: ' + resource_metachart_ref)


if __name__ == '__main__':
    main()
