# Frequently asked questions

## Images

The chart is designed to store all images used by the release in one place.

Example:

```yaml
images:
  alpine:
    repository: alpine
    tag: latest
    pullPolicy: Always

  nginx:
    repository: nginx
    tag: latest
    pullPolicy: Always

deployments:
  main:
    spec:
      pod:
        spec:
          containers:
            main:
              #: Use the `nginx` image
              imageRef: nginx
              ports:
                - name: http
                  containerPort: 80
```

## Related resources

Some resource kinds support related resource definition. For example, Service
can be defined as related for Deployment, StatefulSet and DaemonSet kinds.

Example:

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
        #: Related `Service` resources which `spec.selector` values will be set
        #: automatically
        main:
          spec:
            ports:
              - name: http
                port: 80
    spec:
      pod:
        spec:
          containers:
            main:
              imageRef: nginx
              ports:
                - name: http
                  containerPort: 80
```

## Resource kind settings

Use `settings.kind` to manipulate kind settings

Example:

```yaml
settings:
  pods:
    #: Whether resource kind must be disabled (default: false)
    disable: false

    #: Defaults for all `pods` resources (including Deployment and other
    #: Pod-containing resources kinds)
    defaults:
      spec:
        serviceAccountName: "external-name"

        #: Set to empty value to satisfy schema rule and not break functionality
        containers: {}
```

## Refer to another release resource

```yaml
images:
  nginx:
    repository: nginx
    tag: latest
    pullPolicy: Always

configmaps:
  config:
    data: {}

deployments:
  main:
    spec:
      pod:
        spec:
          containers:
            main:
              imageRef: nginx
              envFrom:
                - configMapRef:
                    #: Refer to the `config` ConfigMap defined below by name
                    name: '{{ include "metachart.fullname" $ }}-config'
```

## String values templating

Always access to root context as `$.` in string templates

```yaml
context:
  contextSetting: value

configmaps:
  config:
    data:
      fullname: '{{ include "metachart.fullname" $ }}'
      contextSetting: '{{ $.Values.context.contextSetting }}'
```

## Checksums

The feature is available for Deployment, DaemonSet, StatefulSet resources
kinds. As checksum sources `configmaps` and `secrets` can be used.

```yaml
images:
  nginx:
    repository: nginx
    tag: latest
    pullPolicy: Always

configmaps:
  first:
    data: {}
  second:
    data: {}

deployments:

  #: Pods will be re-created on any configmap change
  all-configmaps:
    metadata:
      checksums:
        configmaps: "*"
    spec:
      pod:
        spec:
          containers:
            main:
              imageRef: nginx

  #: Pods will be re-created only on `second` configmap change
  single-configmap:
    metadata:
      checksums:
        configmaps:
          - second
    spec:
      pod:
        spec:
          containers:
            main:
              imageRef: nginx
```
