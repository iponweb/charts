{{- /* Resources definition */}}
{{- define "metachart.settings" }}
acraccesstokens:
  apiVersion: generators.external-secrets.io/v1beta1
  kindCamelCase: ACRAccessToken
  preprocess: false
clusterexternalsecrets:
  apiVersion: external-secrets.io/v1beta1
  kindCamelCase: ExternalSecret
  preprocess: false
clustersecretstores:
  apiVersion: external-secrets.io/v1beta1
  kindCamelCase: ExternalSecret
  preprocess: false
ecrauthorizationtokens:
  apiVersion: generators.external-secrets.io/v1beta1
  kindCamelCase: ECRAuthorizationToken
  preprocess: false
externalsecrets:
  apiVersion: external-secrets.io/v1beta1
  kindCamelCase: ExternalSecret
  preprocess: false
fakes:
  apiVersion: generators.external-secrets.io/v1beta1
  kindCamelCase: Fake
  preprocess: false
gcraccesstoken:
  apiVersion: generators.external-secrets.io/v1beta1
  kindCamelCase: GCRAccessToken
  preprocess: false
passwords:
  apiVersion: generators.external-secrets.io/v1beta1
  kindCamelCase: Password
  preprocess: false
pushsecrets:
  apiVersion: external-secrets.io/v1alpha1
  kindCamelCase: PushSecret
  preprocess: false
secretstores:
  apiVersion: external-secrets.io/v1beta1
  kindCamelCase: ExternalSecret
  preprocess: false
{{- end }}