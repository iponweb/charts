{{- /* Resources definition */}}
{{- define "metachart.settings" }}
acraccesstokens:
  apiVersion: generators.external-secrets.io/v1alpha1
  kindCamelCase: ACRAccessToken
  preprocess: false
alertmanagerconfigs:
  apiVersion: monitoring.coreos.com/v1alpha1
  kindCamelCase: AlertmanagerConfig
  preprocess: false
apiservices:
  apiVersion: apiregistration.k8s.io/v1
  kindCamelCase: APIService
  preprocess: false
certificatesigningrequests:
  apiVersion: certificates.k8s.io/v1
  kindCamelCase: CertificateSigningRequest
  preprocess: false
clusterexternalsecrets:
  apiVersion: external-secrets.io/v1
  kindCamelCase: ClusterExternalSecret
  preprocess: false
clustergenerators:
  apiVersion: generators.external-secrets.io/v1alpha1
  kindCamelCase: ClusterGenerator
  preprocess: false
clusterpushsecrets:
  apiVersion: external-secrets.io/v1alpha1
  kindCamelCase: PushSecret
  preprocess: false
clusterrolebindings:
  apiVersion: rbac.authorization.k8s.io/v1
  kindCamelCase: ClusterRoleBinding
  preprocess: false
clusterroles:
  apiVersion: rbac.authorization.k8s.io/v1
  kindCamelCase: ClusterRole
  preprocess: false
clustersecretstores:
  apiVersion: external-secrets.io/v1
  kindCamelCase: ClusterSecretStore
  preprocess: false
configmaps:
  apiVersion: v1
  kindCamelCase: ConfigMap
  preprocess: false
cronjobs:
  apiVersion: batch/v1
  kindCamelCase: CronJob
  preprocess: true
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
ecrauthorizationtokens:
  apiVersion: generators.external-secrets.io/v1alpha1
  kindCamelCase: ECRAuthorizationToken
  preprocess: false
externalsecrets:
  apiVersion: external-secrets.io/v1
  kindCamelCase: ExternalSecret
  preprocess: false
fakes:
  apiVersion: generators.external-secrets.io/v1alpha1
  kindCamelCase: Fake
  preprocess: false
gcraccesstokens:
  apiVersion: generators.external-secrets.io/v1alpha1
  kindCamelCase: GCRAccessToken
  preprocess: false
githubaccesstokens:
  apiVersion: generators.external-secrets.io/v1alpha1
  kindCamelCase: GithubAccessToken
  preprocess: false
grafanas:
  apiVersion: generators.external-secrets.io/v1alpha1
  kindCamelCase: Grafana
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
  preprocess: true
mfas:
  apiVersion: generators.external-secrets.io/v1alpha1
  kindCamelCase: MFA
  preprocess: false
mutatingwebhookconfigurations:
  apiVersion: admissionregistration.k8s.io/v1
  kindCamelCase: MutatingWebhookConfiguration
  preprocess: false
networkpolicies:
  apiVersion: networking.k8s.io/v1
  kindCamelCase: Ingress
  preprocess: false
passwords:
  apiVersion: generators.external-secrets.io/v1alpha1
  kindCamelCase: Password
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
podmonitors:
  apiVersion: monitoring.coreos.com/v1
  kindCamelCase: PodMonitor
  preprocess: true
pods:
  apiVersion: v1
  kindCamelCase: Pod
  preprocess: true
priorityclasses:
  apiVersion: scheduling.k8s.io/v1
  kindCamelCase: PriorityClass
  preprocess: false
prometheusrules:
  apiVersion: monitoring.coreos.com/v1
  kindCamelCase: PrometheusRule
  preprocess: false
pushsecrets:
  apiVersion: external-secrets.io/v1alpha1
  kindCamelCase: PushSecret
  preprocess: false
quayaccesstokens:
  apiVersion: generators.external-secrets.io/v1alpha1
  kindCamelCase: QuayAccessToken
  preprocess: false
rolebindings:
  apiVersion: rbac.authorization.k8s.io/v1
  kindCamelCase: RoleBinding
  preprocess: false
roles:
  apiVersion: rbac.authorization.k8s.io/v1
  kindCamelCase: Role
  preprocess: false
secretproviderclasses:
  apiVersion: secrets-store.csi.x-k8s.io/v1
  kindCamelCase: SecretProviderClass
  preprocess: false
secretproviderclasspodstatuses:
  apiVersion: secrets-store.csi.x-k8s.io/v1
  kindCamelCase: SecretProviderClassPodStatus
  preprocess: false
secrets:
  apiVersion: v1
  kindCamelCase: Secret
  preprocess: false
secretstores:
  apiVersion: external-secrets.io/v1
  kindCamelCase: SecretStore
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
stssessiontokens:
  apiVersion: generators.external-secrets.io/v1alpha1
  kindCamelCase: STSSessionToken
  preprocess: false
uuids:
  apiVersion: generators.external-secrets.io/v1alpha1
  kindCamelCase: UUID
  preprocess: false
validatingwebhookconfigurations:
  apiVersion: admissionregistration.k8s.io/v1
  kindCamelCase: ValidatingWebhookConfiguration
  preprocess: false
vaultdynamicsecrets:
  apiVersion: generators.external-secrets.io/v1alpha1
  kindCamelCase: VaultDynamicSecret
  preprocess: false
webhooks:
  apiVersion: generators.external-secrets.io/v1alpha1
  kindCamelCase: Webhook
  preprocess: false
{{- end }}