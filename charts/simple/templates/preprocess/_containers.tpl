{{- define "metachart.preprocess.containers" -}}
{{- /* Cleanup context from the function params */}}
{{- $params := $.params | deepCopy }}{{- $context := omit $ "params" }}
{{- /* Building the Container resource */}}
{{- $definition := $params.definition }}
{{- /* Execution */}}
{{- /* Apply container defaults */}}
{{- $definition = include "metachart.setDefaults" (merge (dict "params"
  (dict
    "definition" $definition
    "kind" "containers"
  )) $) | fromJson }}
{{- /* Rendering */}}
{{- $result := merge
  (include "metachart.imageSpecByRef" (merge (dict "params" (dict "imageRef" $definition.imageRef)) $) | fromYaml)
  (omit $definition "imageRef")
}}
{{- /* Return */}}
{{- $result | toJson }}
{{- end }}
