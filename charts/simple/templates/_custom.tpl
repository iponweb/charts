{{/*
Get image definition by the reference name
*/}}
{{- define "metachart.imageSpecByRef" -}}
{{- /* Cleanup context from the function params */}}
{{- $params := $.params | deepCopy }}
{{- $context := omit $ "params" }}
{{- /* Get params */}}
{{- $resource := $params.resource }}
{{- $image := index $.Values.images $params.imageRef -}}
{{- /* Execution */}}
{{- $result := dict
  "image" (printf "%s:%s" $image.repository $image.tag)
  "imagePullPolicy" $image.pullPolicy
}}
{{- /* Return */}}
{{- $result | toJson }}
{{- end }}

{{- define "metachart.checksum" -}}
{{- include "metachart.checksumKinds" (merge (dict "params"
    (dict
      "kinds" (list "configmaps" "secrets")
    )) $) }}
{{- end }}
