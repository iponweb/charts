{{- /* Resources definition */}}
{{- define "metachart.settings" }}
awsnodetemplate:
  apiVersion: karpenter.k8s.aws/v1alpha1
  kindCamelCase: AWSNodeTemplate
  preprocess: false
provisioners:
  apiVersion: karpenter.sh/v1alpha5
  kindCamelCase: Provisioner
  preprocess: false
{{- end }}