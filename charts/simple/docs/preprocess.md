# Preprocess

Some resources are using a bit different schema from the real one, so this
document describes that differences.

Also, it describes some optimization done to simplify chart usage.

## Image

That's not a resource, but it's a helper to store all images definitions
used in the release in one place.

Example:

```yaml
images:
  nginx:
    repository: nginx
    tag: latest
    pullPolicy: Always
```

## Container

That's not a resource but a part of the [Pod](#Pod) resource.

The `image` and `imagePullPolicy` replaced by the `imageRef` field which value
is a name of a [Image](#Image) object.

## Pod

Fields `spec.containers` and `spec.initContainers` are maps instead of lists
which keys and values are [Container](#Container) names definition.

Example:

```yaml
images:
  nginx:
    repository: nginx
    tag: latest
    pullPolicy: Always

pods:
  main:
    spec:
      containers:
        main:
          imageRef: nginx
```

will be rendered to:

```yaml
apiVersion: v1
kind: Pod
metadata:
  annotations: {}
  labels:
    app.kubernetes.io/component: pods-main
    app.kubernetes.io/instance: release-name
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/version: none
    helm.sh/chart: simple-0.0.1
  name: release-name-main
spec:
  containers:
  - image: nginx:latest
    imagePullPolicy: Always
    name: main
```

## Deployment

1. Field `spec.template` is replaced by the `spec.pod` consuming [Pod](#Pod)
   resource
2. Field `spec.selector` enforced to discover only Pods produced by this 
   Deployment

Example:

```yaml
images:
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
              imageRef: nginx
```

will be rendered to:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  annotations: {}
  labels:
    app.kubernetes.io/component: deployments-main
    app.kubernetes.io/instance: release-name
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/version: none
    helm.sh/chart: simple-0.0.1
  name: release-name-main
spec:
  selector:
    matchLabels:
      app.kubernetes.io/component: deployments-main
      app.kubernetes.io/instance: release-name
  template:
    metadata:
      annotations: {}
      labels:
        app.kubernetes.io/component: deployments-main
        app.kubernetes.io/instance: release-name
        app.kubernetes.io/managed-by: Helm
        app.kubernetes.io/version: none
        helm.sh/chart: simple-0.0.1
    spec:
      containers:
      - image: nginx:latest
        imagePullPolicy: Always
        name: main
```


## DaemonSet

Same as [Deployment](#Deployment) preprocessor.

## StatefulSet

Same as [Deployment](#Deployment) preprocessor.

1. Same as [Deployment](#Deployment) preprocessor.
2. Field `spec.volumeClaimTemplates` is a map instead of list
   which keys and values are PersistentVolumeClaim template names and 
   definitions.

Example:

```yaml
images:
  nginx:
    repository: nginx
    tag: latest
    pullPolicy: Always

statefulsets:
  main:
    related:
      services:
        main-headless:
          spec:
            clusterIP: None
    spec:
      serviceName: '{{ include "metachart.fullname" $ }}-main-headless'
      pod:
        spec:
          containers:
            main:
              imageRef: nginx
```

will be rendered to:

```yaml
---
apiVersion: v1
kind: Service
metadata:
  annotations: {}
  labels:
    app.kubernetes.io/component: statefulsets-main
    app.kubernetes.io/instance: release-name
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/version: none
    helm.sh/chart: simple-0.0.1
  name: release-name-main-headless
spec:
  clusterIP: None
  selector:
    app.kubernetes.io/component: statefulsets-main
    app.kubernetes.io/instance: release-name
...
---
apiVersion: apps/v1
kind: StatefulSet
metadata:
  annotations: {}
  labels:
    app.kubernetes.io/component: statefulsets-main
    app.kubernetes.io/instance: release-name
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/version: none
    helm.sh/chart: simple-0.0.1
  name: release-name-main
spec:
  selector:
    matchLabels:
      app.kubernetes.io/component: statefulsets-main
      app.kubernetes.io/instance: release-name
  serviceName: release-name-main-headless
  template:
    metadata:
      annotations: {}
      labels:
        app.kubernetes.io/component: statefulsets-main
        app.kubernetes.io/instance: release-name
        app.kubernetes.io/managed-by: Helm
        app.kubernetes.io/version: none
        helm.sh/chart: simple-0.0.1
    spec:
      containers:
      - image: nginx:latest
        imagePullPolicy: Always
        name: main
  volumeClaimTemplates: []
...
```

## Job

Field `spec.template` is replaced by the `spec.pod` consuming [Pod](#Pod)
resource

Example:

```yaml
images:
  alpine:
    repository: alpine
    tag: latest
    pullPolicy: Always

jobs:
  main:
    spec:
      pod:
        spec:
          containers:
            main:
              imageRef: alpine
```

will be rendered to:

```yaml
apiVersion: batch/v1
kind: Job
metadata:
  annotations: {}
  labels:
    app.kubernetes.io/component: jobs-main
    app.kubernetes.io/instance: release-name
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/version: none
    helm.sh/chart: simple-0.0.1
  name: release-name-main
spec:
  template:
    metadata:
      annotations: {}
      labels:
        app.kubernetes.io/component: jobs-main
        app.kubernetes.io/instance: release-name
        app.kubernetes.io/managed-by: Helm
        app.kubernetes.io/version: none
        helm.sh/chart: simple-0.0.1
    spec:
      containers:
      - image: alpine:latest
        imagePullPolicy: Always
        name: main
```

## CronJob

Field `spec.jobTemplate` is replaced by the `spec.job` consuming [Job](#Job)
resource

Example:

```yaml
images:
  alpine:
    repository: alpine
    tag: latest
    pullPolicy: Always

cronjobs:
  main:
    spec:
      schedule: "* * * * *"
      job:
        spec:
          pod:
            spec:
              containers:
                main:
                  imageRef: alpine
```

will be rendered to:

```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
  annotations: {}
  labels:
    app.kubernetes.io/component: cronjobs-main
    app.kubernetes.io/instance: release-name
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/version: none
    helm.sh/chart: simple-0.0.1
  name: release-name-main
spec:
  jobTemplate:
    metadata:
      annotations: {}
      labels:
        app.kubernetes.io/component: cronjobs-main
        app.kubernetes.io/instance: release-name
        app.kubernetes.io/managed-by: Helm
        app.kubernetes.io/version: none
        helm.sh/chart: simple-0.0.1
    spec:
      template:
        metadata:
          annotations: {}
          labels:
            app.kubernetes.io/component: cronjobs-main
            app.kubernetes.io/instance: release-name
            app.kubernetes.io/managed-by: Helm
            app.kubernetes.io/version: none
            helm.sh/chart: simple-0.0.1
        spec:
          containers:
          - image: alpine:latest
            imagePullPolicy: Always
            name: main
  schedule: '* * * * *'
```

## PodMonitor

If defined as a related resource, `spec.selector.matchLabels` field value 
enforced to label selector of the parent resource and 
`spec.namespaceSelector.matchNames` to the release namespace.

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
      podmonitors:
        main:
          spec:
            #: Define empty to satisfy schema requirements
            #: Will be overridden by preprocessor
            selector: {}

            podMetricsEndpoints:
              - port: metrics
    spec:
      pod:
        spec:
          containers:
            main:
              imageRef: nginx
              ports:
                - name: metrics
                  containerPort: 8080
```

will be rendered to:

```yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  annotations: {}
  labels:
    app.kubernetes.io/component: deployments-main
    app.kubernetes.io/instance: release-name
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/version: none
    helm.sh/chart: simple-0.0.1
  name: release-name-main
spec:
  selector:
    matchLabels:
      app.kubernetes.io/component: deployments-main
      app.kubernetes.io/instance: release-name
  template:
    metadata:
      annotations: {}
      labels:
        app.kubernetes.io/component: deployments-main
        app.kubernetes.io/instance: release-name
        app.kubernetes.io/managed-by: Helm
        app.kubernetes.io/version: none
        helm.sh/chart: simple-0.0.1
    spec:
      containers:
        - image: nginx:latest
          imagePullPolicy: Always
          name: main
          ports:
            - containerPort: 8080
              name: metrics
... 
---
apiVersion: monitoring.coreos.com/v1
kind: PodMonitor
metadata:
  annotations: {}
  labels:
    app.kubernetes.io/component: deployments-main
    app.kubernetes.io/instance: release-name
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/version: none
    helm.sh/chart: simple-0.0.1
  name: release-name-main
spec:
  namespaceSelector:
    matchNames:
      - default
  podMetricsEndpoints:
    - port: metrics
  selector:
    matchLabels:
      app.kubernetes.io/component: deployments-main
      app.kubernetes.io/instance: release-name
...
```

## PodDisruptionBudget

If defined as a related resource, `spec.selector` field value enforced to label 
selector of the parent resource.

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
      poddisruptionbudgets:
        main:
          spec:
            maxUnavailable: 1
    spec:
      pod:
        spec:
          containers:
            main:
              imageRef: nginx
```

will be rendered to:

```yaml
---
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  annotations: {}
  labels:
    app.kubernetes.io/component: deployments-main
    app.kubernetes.io/instance: release-name
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/version: none
    helm.sh/chart: simple-0.0.1
  name: release-name-main
spec:
  maxUnavailable: 1
  selector:
    matchLabels:
      app.kubernetes.io/component: deployments-main
      app.kubernetes.io/instance: release-name
...
---
apiVersion: apps/v1
kind: Deployment
metadata:
  annotations: {}
  labels:
    app.kubernetes.io/component: deployments-main
    app.kubernetes.io/instance: release-name
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/version: none
    helm.sh/chart: simple-0.0.1
  name: release-name-main
spec:
  selector:
    matchLabels:
      app.kubernetes.io/component: deployments-main
      app.kubernetes.io/instance: release-name
  template:
    metadata:
      annotations: {}
      labels:
        app.kubernetes.io/component: deployments-main
        app.kubernetes.io/instance: release-name
        app.kubernetes.io/managed-by: Helm
        app.kubernetes.io/version: none
        helm.sh/chart: simple-0.0.1
    spec:
      containers:
      - image: nginx:latest
        imagePullPolicy: Always
        name: main
...
```

## Service

If defined as a related resource, `spec.selector` field value enforced to label
selector of the parent resource.

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

will be rendered to:

```yaml
---
apiVersion: v1
kind: Service
metadata:
  annotations: {}
  labels:
    app.kubernetes.io/component: deployments-main
    app.kubernetes.io/instance: release-name
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/version: none
    helm.sh/chart: simple-0.0.1
  name: release-name-main
spec:
  ports:
  - port: 80
    targetPort: web
  selector:
    app.kubernetes.io/component: deployments-main
    app.kubernetes.io/instance: release-name
...
---
apiVersion: apps/v1
kind: Deployment
metadata:
  annotations: {}
  labels:
    app.kubernetes.io/component: deployments-main
    app.kubernetes.io/instance: release-name
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/version: none
    helm.sh/chart: simple-0.0.1
  name: release-name-main
spec:
  selector:
    matchLabels:
      app.kubernetes.io/component: deployments-main
      app.kubernetes.io/instance: release-name
  template:
    metadata:
      annotations: {}
      labels:
        app.kubernetes.io/component: deployments-main
        app.kubernetes.io/instance: release-name
        app.kubernetes.io/managed-by: Helm
        app.kubernetes.io/version: none
        helm.sh/chart: simple-0.0.1
    spec:
      containers:
      - image: nginx:latest
        imagePullPolicy: Always
        name: main
        ports:
        - containerPort: 80
          name: web
...
```
