{{- /* Resources definition */}}
{{- define "metachart.settings" }}
clusterexternalsecrets:
  apiVersion: external-secrets.io/v1beta1
  kindCamelCase: ExternalSecret
  preprocess: false
clustersecretstores:
  apiVersion: external-secrets.io/v1beta1
  kindCamelCase: ExternalSecret
  preprocess: false
externalsecrets:
  apiVersion: external-secrets.io/v1beta1
  kindCamelCase: ExternalSecret
  preprocess: false
secretstores:
  apiVersion: external-secrets.io/v1beta1
  kindCamelCase: ExternalSecret
  preprocess: false
{{- end }}