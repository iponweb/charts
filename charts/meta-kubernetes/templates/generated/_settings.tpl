{{- /* Resources definition */}}
{{- define "metachart.settings" }}
apiservices:
  apiVersion: apiregistration.k8s.io/v1
  kindCamelCase: APIService
  preprocess: false
certificatesigningrequests:
  apiVersion: certificates.k8s.io/v1
  kindCamelCase: CertificateSigningRequest
  preprocess: false
clusterrolebindings:
  apiVersion: rbac.authorization.k8s.io/v1
  kindCamelCase: ClusterRoleBinding
  preprocess: false
clusterroles:
  apiVersion: rbac.authorization.k8s.io/v1
  kindCamelCase: ClusterRole
  preprocess: false
configmaps:
  apiVersion: v1
  kindCamelCase: ConfigMap
  preprocess: false
cronjobs:
  apiVersion: batch/v1
  kindCamelCase: CronJob
  preprocess: true
csidrivers:
  apiVersion: storage.k8s.io/v1
  kindCamelCase: CSIDriver
  preprocess: false
customresourcedefinitions:
  apiVersion: apiextensions.k8s.io/v1
  kindCamelCase: CustomResourceDefinition
  preprocess: false
daemonsets:
  apiVersion: apps/v1
  kindCamelCase: DaemonSet
  preprocess: true
deployments:
  apiVersion: apps/v1
  kindCamelCase: Deployment
  preprocess: true
flowschemas:
  apiVersion: flowcontrol.apiserver.k8s.io/v1beta3
  kindCamelCase: FlowSchema
  preprocess: false
horizontalpodautoscalers:
  apiVersion: autoscaling/v2
  kindCamelCase: HorizontalPodAutoscaler
  preprocess: false
ingressclasses:
  apiVersion: networking.k8s.io/v1
  kindCamelCase: IngressClass
  preprocess: false
ingresses:
  apiVersion: networking.k8s.io/v1
  kindCamelCase: Ingress
  preprocess: false
jobs:
  apiVersion: batch/v1
  kindCamelCase: Job
  preprocess: true
limitranges:
  apiVersion: v1
  kindCamelCase: LimitRange
  preprocess: false
mutatingwebhookconfigurations:
  apiVersion: admissionregistration.k8s.io/v1
  kindCamelCase: MutatingWebhookConfiguration
  preprocess: false
namespaces:
  apiVersion: v1
  kindCamelCase: Namespace
  preprocess: false
networkpolicies:
  apiVersion: networking.k8s.io/v1
  kindCamelCase: NetworkPolicy
  preprocess: false
persistentvolumeclaims:
  apiVersion: v1
  kindCamelCase: PersistentVolumeClaim
  preprocess: false
persistentvolumes:
  apiVersion: v1
  kindCamelCase: PersistentVolume
  preprocess: false
poddisruptionbudgets:
  apiVersion: policy/v1
  kindCamelCase: PodDisruptionBudget
  preprocess: true
pods:
  apiVersion: v1
  kindCamelCase: Pod
  preprocess: true
podtemplates:
  apiVersion: v1
  kindCamelCase: PodTemplate
  preprocess: false
priorityclasses:
  apiVersion: scheduling.k8s.io/v1
  kindCamelCase: PriorityClass
  preprocess: false
prioritylevelconfigurations:
  apiVersion: flowcontrol.apiserver.k8s.io/v1beta3
  kindCamelCase: PriorityLevelConfiguration
  preprocess: false
resourcequotas:
  apiVersion: v1
  kindCamelCase: ResourceQuota
  preprocess: false
rolebindings:
  apiVersion: rbac.authorization.k8s.io/v1
  kindCamelCase: RoleBinding
  preprocess: false
roles:
  apiVersion: rbac.authorization.k8s.io/v1
  kindCamelCase: Role
  preprocess: false
secrets:
  apiVersion: v1
  kindCamelCase: Secret
  preprocess: false
serviceaccounts:
  apiVersion: v1
  kindCamelCase: ServiceAccount
  preprocess: false
services:
  apiVersion: v1
  kindCamelCase: Service
  preprocess: true
statefulsets:
  apiVersion: apps/v1
  kindCamelCase: StatefulSet
  preprocess: true
storageclasses:
  apiVersion: storage.k8s.io/v1
  kindCamelCase: StorageClass
  preprocess: false
validatingwebhookconfigurations:
  apiVersion: admissionregistration.k8s.io/v1
  kindCamelCase: ValidatingWebhookConfiguration
  preprocess: false
{{- end }}