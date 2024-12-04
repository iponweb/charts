# Resources

A set of resources supported by the chart

## Non-Kubernetes resources

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| images   |  | - |


## admissionregistration.k8s.io/v1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| mutatingwebhookconfigurations   | MutatingWebhookConfiguration | - |
| validatingwebhookconfigurations   | ValidatingWebhookConfiguration | - |


## apiextensions.k8s.io/v1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| customresourcedefinitions   | CustomResourceDefinition | - |


## apiregistration.k8s.io/v1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| apiservices   | APIService | - |


## apps/v1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| daemonsets   | DaemonSet | [link](templates/preprocess/_daemonsets.tpl) |
| deployments   | Deployment | [link](templates/preprocess/_deployments.tpl) |
| statefulsets   | StatefulSet | [link](templates/preprocess/_statefulsets.tpl) |


## autoscaling/v1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| horizontalpodautoscalers   | HorizontalPodAutoscaler | - |


## batch/v1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| cronjobs   | CronJob | [link](templates/preprocess/_cronjobs.tpl) |
| jobs   | Job | [link](templates/preprocess/_jobs.tpl) |


## certificates.k8s.io/v1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| certificatesigningrequests   | CertificateSigningRequest | - |


## external-secrets.io/v1beta1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| clusterexternalsecrets   | ClusterExternalSecret | - |
| clustersecretstores   | ClusterSecretStore | - |
| externalsecrets   | ExternalSecret | - |
| secretstores   | SecretStore | - |


## monitoring.coreos.com/v1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| podmonitors   | PodMonitor | [link](templates/preprocess/_podmonitors.tpl) |
| prometheusrules   | PrometheusRule | - |


## monitoring.coreos.com/v1alpha1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| alertmanagerconfigs   | AlertmanagerConfig | - |


## networking.k8s.io/v1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| ingressclasses   | Ingress | - |
| ingresses   | Ingress | - |
| networkpolicies   | Ingress | - |


## policy/v1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| poddisruptionbudgets   | PodDisruptionBudget | [link](templates/preprocess/_poddisruptionbudgets.tpl) |


## rbac.authorization.k8s.io/v1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| clusterrolebindings   | ClusterRoleBinding | - |
| clusterroles   | ClusterRole | - |
| rolebindings   | RoleBinding | - |
| roles   | Role | - |


## scheduling.k8s.io/v1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| priorityclasses   | PriorityClass | - |


## secrets-store.csi.x-k8s.io

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| secretproviderclasses   | SecretProviderClass | - |
| secretproviderclasspodstatuses   | SecretProviderClassPodStatus | - |


## storage.k8s.io/v1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| storageclasses   | StorageClass | - |


## v1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| configmaps   | ConfigMap | - |
| persistentvolumeclaims   | PersistentVolumeClaim | - |
| persistentvolumes   | PersistentVolume | - |
| pods   | Pod | [link](templates/preprocess/_pods.tpl) |
| secrets   | Secret | - |
| serviceaccounts   | ServiceAccount | - |
| services   | Service | [link](templates/preprocess/_services.tpl) |