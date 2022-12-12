# simple

`simple` is a [metachart](https://github.com/iponweb/metachart) born
[Helm](https://helm.sh/) Chart supporting a superset of Kubernetes official and
custom resource kinds required to install most kinds of software.

Custom resources are supported from:

- [external-secrets](https://github.com/external-secrets/external-secrets)
- [prometheus-operator](https://github.com/external-secrets/prometheus-operator)

## What is it?

The chart is aimed to:

- Use Helm without having to write your own charts
- Use [JSON Schema](values.schema.full.json) in your favourite IDE for
  autocompletion and validation of your values files
- Complete resources support - you do not need to think whether a particular
  field is supported by the chart or not
- Go templating is supported by all string field, see [FAQ](docs/faq.md).
- Define all images used by the release in one place, see [FAQ](docs/faq.md).
- Some resources schema has been changed for better readiness for values files
  overrides, see [Preprocess](docs/preprocess.md).
- Define related resources and do not think about how to define label
  selectors, see [FAQ](docs/faq.md).
- Use checksums for automatic pods re-creation, see [FAQ](docs/faq.md).
- Define defaults for every resource kind, see [FAQ](docs/faq.md).

For complete resources list support see [resources](docs/resources.md).

## Quickstart

Add the [Helm](https://helm.sh/) repository:

```shell
helm repo add iponweb https://iponweb.github.io/charts/
```

Add the [values.schema.full.json](values.schema.full.json) schema to your
favourite IDE to enable values file autocompletion and validation. In
comparison to [values.schema.json](values.schema.json) it has properties
descriptions not stripped.

Examples:
- [IntelliJ IDEA](https://www.jetbrains.com/help/idea/json.html#ws_json_schema_add_custom)
- [Visual Studio Code](https://code.visualstudio.com/docs/languages/json#_json-schemas-and-settings)
- [Sublime Text](https://github.com/sublimelsp/LSP-json)

Define the sample `values.yaml` file:

```yaml
images:
  nginx:
    repository: nginx
    tag: latest
    pullPolicy: Always

deployments:
  main:
    related:
      services:
        main:
          spec:
            ports:
              - port: 80
                targetPort: web
    spec:
      pod:
        spec:
          containers:
            main:
              imageRef: nginx
              ports:
                - containerPort: 80
                  name: web
```

Install the release:

```shell
helm upgrade --install release-name -f values.yaml iponweb/simple
```

List deployed resources:
```shell
$ kubectl get all
NAME                                     READY   STATUS    RESTARTS   AGE
pod/release-name-main-56b7c8d5f6-fnpwh   1/1     Running   0          23s

NAME                        TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE
service/kubernetes          ClusterIP   10.100.0.1       <none>        443/TCP   185d
service/release-name-main   ClusterIP   10.100.251.167   <none>        80/TCP    23s

NAME                                READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/release-name-main   1/1     1            1           23s

NAME                                           DESIRED   CURRENT   READY   AGE
replicaset.apps/release-name-main-56b7c8d5f6   1         1         1       23s
```

## Documentation

Read the [Documentation](docs) section. Some examples can be found in the
[examples](examples) directory.

Also, see the
`metachart` [Documentation](https://github.com/iponweb/metachart/docs) for more
details.

## Requirements

Minimal supported [Helm](https://helm.sh/) version is `v3.2.0`.

## Versioning

Versions are following the [semver](https://semver.org/) v2.0 specification.
