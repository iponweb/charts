{{- /* Resources definition */}}
{{- define "metachart.settings" }}
assign:
  apiVersion: mutations.gatekeeper.sh/v1
  kindCamelCase: Assign
  preprocess: false
assignmetadata:
  apiVersion: mutations.gatekeeper.sh/v1
  kindCamelCase: AssignMetadata
  preprocess: false
configs:
  apiVersion: config.gatekeeper.sh/v1alpha1
  kindCamelCase: Config
  preprocess: false
constraintpodstatuses:
  apiVersion: status.gatekeeper.sh/v1beta1
  kindCamelCase: ConstraintPodStatus
  preprocess: false
constrainttemplatepodstatuses:
  apiVersion: ""
  kindCamelCase: ""
  preprocess: false
constrainttemplates:
  apiVersion: templates.gatekeeper.sh/v1
  kindCamelCase: ConstraintTemplate
  preprocess: false
expansiontemplate:
  apiVersion: expansion.gatekeeper.sh/v1alpha1
  kindCamelCase: ExpansionTemplate
  preprocess: false
modifyset:
  apiVersion: mutations.gatekeeper.sh/v1
  kindCamelCase: ModifySet
  preprocess: false
mutatorpodstatuses:
  apiVersion: ""
  kindCamelCase: ""
  preprocess: false
providers:
  apiVersion: externaldata.gatekeeper.sh/v1alpha1
  kindCamelCase: Provider
  preprocess: false
{{- end }}