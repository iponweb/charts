{{- define "metachart.preprocess.pods" -}}
{{- /* Cleanup context from the function params */}}
{{- $params := $.params | deepCopy }}{{- $context := omit $ "params" }}
{{- /* Get params */}}
{{- $definition := $params.definition }}
{{- $name := $params.name }}
{{- $component := $params.component }}
{{- /* Set pod.spec.initContainers*/}}
{{- if $definition.spec.initContainers }}
  {{- $initContainers := list }}
  {{- range $containerName, $container := $definition.spec.initContainers }}
    {{- $initContainers = append $initContainers (merge
      (dict "name" $containerName)
      (include "metachart.preprocess.containers" (merge (dict "params" (dict
        "definition" $container
      )) $context) | fromJson)
    ) }}
  {{- end }}
  {{- $_ := set $definition.spec "initContainers" $initContainers }}
{{- end }}
{{- /* Set pod.spec.containers*/}}
{{- if $definition.spec.containers }}
  {{- $containers := list }}
  {{- range $containerName, $container := $definition.spec.containers }}
  {{- $containers = append $containers (merge
      (dict "name" $containerName)
      (include "metachart.preprocess.containers" (merge (dict "params" (dict
        "definition" $container
      )) $context) | fromJson)
    ) }}
  {{- end }}
  {{- $_ := set $definition.spec "containers" $containers }}
{{- end }}
{{- /* Return */}}
{{- $definition | toJson }}
{{- end }}
