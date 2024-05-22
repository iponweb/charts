# meta-cert-manager

`meta-cert-manager` is a [metachart](https://github.com/iponweb/metachart)
born [Helm](https://helm.sh/) Chart for
[cert-manager](https://github.com/cert-manager/cert-manager)
operator custom resources

## Quickstart

Add the [Helm](https://helm.sh/) repository:

```shell
helm repo add iponweb https://iponweb.github.io/charts/
```

Add the [values.schema.json](values.schema.json) file to your favourite IDE
to enable values file autocompletion and validation.
Examples:
- [IntelliJ IDEA](https://www.jetbrains.com/help/idea/json.html#ws_json_schema_add_custom)
- [Visual Studio Code](https://code.visualstudio.com/docs/languages/json#_json-schemas-and-settings)
- [Sublime Text](https://github.com/sublimelsp/LSP-json)

Define `values.yaml` with required resources and install the release:

```shell
helm install release-name -f values.yaml iponweb/meta-cert-manager
```

See also [values.example.yaml](values.example.yaml)

## Documentation

For complete resources list support see [resources](docs/resources.md).

See the `metachart` [Documentation](https://github.com/iponweb/metachart/docs)
for more details.

## Requirements

Minimal supported [Helm](https://helm.sh/) version is `v3.2.0`.

## Versioning

Chart major and minor version parts follow
[cert-manager](https://github.com/cert-manager/cert-manager)
versions which has been used for the chart generation. Patch component is used
for charts own changes/fixes.
