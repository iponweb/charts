{{- /* Resources definition */}}
{{- define "metachart.settings" }}
alertmanagerconfigs:
  apiVersion: monitoring.coreos.com/v1beta1
  kindCamelCase: AlertmanagerConfig
  preprocess: false
alertmanagers:
  apiVersion: monitoring.coreos.com/v1
  kindCamelCase: PodMonitor
  preprocess: false
podmonitors:
  apiVersion: monitoring.coreos.com/v1
  kindCamelCase: PodMonitor
  preprocess: false
probes:
  apiVersion: monitoring.coreos.com/v1
  kindCamelCase: PodMonitor
  preprocess: false
prometheuses:
  apiVersion: monitoring.coreos.com/v1
  kindCamelCase: PodMonitor
  preprocess: false
prometheusrules:
  apiVersion: monitoring.coreos.com/v1
  kindCamelCase: PodMonitor
  preprocess: false
servicemonitors:
  apiVersion: monitoring.coreos.com/v1
  kindCamelCase: PodMonitor
  preprocess: false
thanosrulers:
  apiVersion: monitoring.coreos.com/v1
  kindCamelCase: PodMonitor
  preprocess: false
{{- end }}