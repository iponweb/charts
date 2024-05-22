{{- /* Resources definition */}}
{{- define "metachart.settings" }}
certificaterequests:
  apiVersion: cert-manager.io/v1
  kindCamelCase: CertificateRequest
  preprocess: false
certificates:
  apiVersion: cert-manager.io/v1
  kindCamelCase: Certificate
  preprocess: false
challenges:
  apiVersion: acme.cert-manager.io/v1
  kindCamelCase: Challenge
  preprocess: false
clusterissuers:
  apiVersion: cert-manager.io/v1
  kindCamelCase: ClusterIssuer
  preprocess: false
issuers:
  apiVersion: cert-manager.io/v1
  kindCamelCase: Issuer
  preprocess: false
orders:
  apiVersion: acme.cert-manager.io/v1
  kindCamelCase: Order
  preprocess: false
{{- end }}