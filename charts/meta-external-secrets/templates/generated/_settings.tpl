{{- /* Resources definition */}}
{{- define "metachart.settings" }}
acraccesstokens:
  apiVersion: generators.external-secrets.io/v1alpha1
  kindCamelCase: ACRAccessToken
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
clustersecretstores:
  apiVersion: external-secrets.io/v1
  kindCamelCase: ClusterSecretStore
  preprocess: false
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
mfas:
  apiVersion: generators.external-secrets.io/v1alpha1
  kindCamelCase: MFA
  preprocess: false
passwords:
  apiVersion: generators.external-secrets.io/v1alpha1
  kindCamelCase: Password
  preprocess: false
pushsecrets:
  apiVersion: external-secrets.io/v1alpha1
  kindCamelCase: PushSecret
  preprocess: false
quayaccesstokens:
  apiVersion: generators.external-secrets.io/v1alpha1
  kindCamelCase: QuayAccessToken
  preprocess: false
secretstores:
  apiVersion: external-secrets.io/v1
  kindCamelCase: SecretStore
  preprocess: false
stssessiontokens:
  apiVersion: generators.external-secrets.io/v1alpha1
  kindCamelCase: STSSessionToken
  preprocess: false
uuids:
  apiVersion: generators.external-secrets.io/v1alpha1
  kindCamelCase: UUID
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