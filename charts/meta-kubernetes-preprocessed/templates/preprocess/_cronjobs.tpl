{{- define "metachart.preprocess.cronjobs" -}}
{{- /* Cleanup context from the function params */}}
{{- $params := $.params | deepCopy }}
{{- $context := omit $ "params" }}
{{- /* Get params */}}
{{- $definition := $params.definition }}
{{- $name := $params.name }}
{{- $component := $params.component }}
{{- /* Execution */}}
{{- /* Read job definition */}}
{{- $job := $definition.spec.job | deepCopy }}
{{- $_ := unset $definition.spec "job" }}
{{- /* Apply metadata */}}
{{- $_ = set $job "metadata" (include "metachart.resourceMeta" (merge (dict "params"
  (dict
    "definition" $job
    "name" $name
    "component" $component
    "withName" false
  )) $context) | fromJson) }}
{{- /* Apply job defaults */}}
{{- $job = include "metachart.setDefaults" (merge (dict "params"
  (dict
    "definition" $job
    "kind" "jobs"
  )) $context) | fromJson }}
{{- /* Set spec.template */}}
{{- $_ = set $definition.spec "jobTemplate" (
  include "metachart.preprocess.jobs" (merge (dict "params"
    (dict
      "definition" $job
      "name" $name
      "component" $component
    )) $context) | fromJson)
}}
{{- /* Return */}}
{{- $definition | toJson }}
{{- end }}
