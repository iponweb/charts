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
  preprocess: false
customresourcedefinitions:
  apiVersion: apiextensions.k8s.io/v1
  kindCamelCase: CustomResourceDefinition
  preprocess: false
daemonsets:
  apiVersion: apps/v1
  kindCamelCase: DaemonSet
  preprocess: false
deployments:
  apiVersion: apps/v1
  kindCamelCase: Deployment
  preprocess: false
horizontalpodautoscalers:
  apiVersion: autoscaling/v1
  kindCamelCase: HorizontalPodAutoscaler
  preprocess: false
ingressclasses:
  apiVersion: networking.k8s.io/v1
  kindCamelCase: Ingress
  preprocess: false
ingresses:
  apiVersion: networking.k8s.io/v1
  kindCamelCase: Ingress
  preprocess: false
jobs:
  apiVersion: batch/v1
  kindCamelCase: Job
  preprocess: false
mutatingwebhookconfigurations:
  apiVersion: admissionregistration.k8s.io/v1
  kindCamelCase: MutatingWebhookConfiguration
  preprocess: false
networkpolicies:
  apiVersion: networking.k8s.io/v1
  kindCamelCase: Ingress
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
  preprocess: false
pods:
  apiVersion: v1
  kindCamelCase: Pod
  preprocess: false
priorityclasses:
  apiVersion: scheduling.k8s.io/v1
  kindCamelCase: PriorityClass
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
  preprocess: false
statefulsets:
  apiVersion: apps/v1
  kindCamelCase: StatefulSet
  preprocess: false
storageclasses:
  apiVersion: storage.k8s.io/v1
  kindCamelCase: StorageClass
  preprocess: false
validatingwebhookconfigurations:
  apiVersion: admissionregistration.k8s.io/v1
  kindCamelCase: ValidatingWebhookConfiguration
  preprocess: false
{{- end }}