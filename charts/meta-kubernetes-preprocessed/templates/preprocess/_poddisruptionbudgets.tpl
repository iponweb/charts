{{- define "metachart.preprocess.poddisruptionbudgets" -}}
{{- /* Cleanup context from the function params */}}
{{- $params := $.params | deepCopy }}
{{- $context := omit $ "params" }}
{{- /* Get params */}}
{{- $definition := $params.definition }}
{{- $name := $params.name }}
{{- $component := $params.component }}
{{- $relatedComponent := $params.relatedComponent }}
{{- /* Execution */}}
{{- if $relatedComponent }}
  {{- $_ := set $definition.spec "selector" (dict "matchLabels" (include "metachart.selectorLabels" (merge (dict "params"
  (dict
    "component" $relatedComponent
  )) $context) | fromJson) ) }}
{{- end }}
{{- /* Return */}}
{{- $definition | toJson }}
{{- end }}
