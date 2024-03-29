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
| daemonsets   | DaemonSet | - |
| deployments   | Deployment | - |
| statefulsets   | StatefulSet | - |


## autoscaling/v2

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| horizontalpodautoscalers   | HorizontalPodAutoscaler | - |


## batch/v1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| cronjobs   | CronJob | - |
| jobs   | Job | - |


## certificates.k8s.io/v1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| certificatesigningrequests   | CertificateSigningRequest | - |


## flowcontrol.apiserver.k8s.io/v1beta3

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| flowschemas   | FlowSchema | - |
| prioritylevelconfigurations   | PriorityLevelConfiguration | - |


## networking.k8s.io/v1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| ingressclasses   | Ingress | - |
| ingresses   | Ingress | - |
| networkpolicies   | Ingress | - |


## policy/v1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| poddisruptionbudgets   | PodDisruptionBudget | - |


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


## storage.k8s.io/v1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| csidrivers   | CSIDriver | - |
| storageclasses   | StorageClass | - |


## v1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| configmaps   | ConfigMap | - |
| limitranges   | LimitRange | - |
| namespaces   | Namespace | - |
| persistentvolumeclaims   | PersistentVolumeClaim | - |
| persistentvolumes   | PersistentVolume | - |
| pods   | Pod | - |
| podtemplates   | PodTemplate | - |
| resourcequotas   | ResourceQuota | - |
| secrets   | Secret | - |
| serviceaccounts   | ServiceAccount | - |
| services   | Service | - |