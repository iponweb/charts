{{- /* Resources definition */}}
{{- define "metachart.settings" }}
vlagents:
  apiVersion: operator.victoriametrics.com/v1
  kindCamelCase: VLAgent
  preprocess: false
vlclusters:
  apiVersion: operator.victoriametrics.com/v1
  kindCamelCase: VLCluster
  preprocess: false
vlogs:
  apiVersion: operator.victoriametrics.com/v1beta1
  kindCamelCase: VLogs
  preprocess: false
vlsingles:
  apiVersion: operator.victoriametrics.com/v1
  kindCamelCase: VLSingle
  preprocess: false
vmagents:
  apiVersion: operator.victoriametrics.com/v1beta1
  kindCamelCase: VMAgent
  preprocess: false
vmalertmanagerconfigs:
  apiVersion: operator.victoriametrics.com/v1beta1
  kindCamelCase: VMAlertmanagerConfig
  preprocess: false
vmalertmanagers:
  apiVersion: operator.victoriametrics.com/v1beta1
  kindCamelCase: VMAlertmanager
  preprocess: false
vmalerts:
  apiVersion: operator.victoriametrics.com/v1beta1
  kindCamelCase: VMAlert
  preprocess: false
vmanomalies:
  apiVersion: operator.victoriametrics.com/v1
  kindCamelCase: VMAnomaly
  preprocess: false
vmauths:
  apiVersion: operator.victoriametrics.com/v1beta1
  kindCamelCase: VMAuth
  preprocess: false
vmclusters:
  apiVersion: operator.victoriametrics.com/v1beta1
  kindCamelCase: VMCluster
  preprocess: false
vmnodescrapes:
  apiVersion: operator.victoriametrics.com/v1beta1
  kindCamelCase: VMNodeScrape
  preprocess: false
vmpodscrapes:
  apiVersion: operator.victoriametrics.com/v1beta1
  kindCamelCase: VMPodScrape
  preprocess: false
vmprobes:
  apiVersion: operator.victoriametrics.com/v1beta1
  kindCamelCase: VMProbe
  preprocess: false
vmrules:
  apiVersion: operator.victoriametrics.com/v1beta1
  kindCamelCase: VMRule
  preprocess: false
vmscrapeconfigs:
  apiVersion: operator.victoriametrics.com/v1beta1
  kindCamelCase: VMScrapeConfig
  preprocess: false
vmservicescrapes:
  apiVersion: operator.victoriametrics.com/v1beta1
  kindCamelCase: VMServiceScrape
  preprocess: false
vmsingles:
  apiVersion: operator.victoriametrics.com/v1beta1
  kindCamelCase: VMSingle
  preprocess: false
vmstaticscrapes:
  apiVersion: operator.victoriametrics.com/v1beta1
  kindCamelCase: VMStaticScrape
  preprocess: false
vmusers:
  apiVersion: operator.victoriametrics.com/v1beta1
  kindCamelCase: VMUser
  preprocess: false
vtclusters:
  apiVersion: operator.victoriametrics.com/v1
  kindCamelCase: VTCluster
  preprocess: false
vtsingles:
  apiVersion: operator.victoriametrics.com/v1
  kindCamelCase: VTSingle
  preprocess: false
{{- end }}