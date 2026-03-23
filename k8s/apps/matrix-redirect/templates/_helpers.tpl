{{- define "matrix-redirect.fullname" -}}
{{- .Release.Name -}}
{{- end -}}

{{- define "matrix-redirect.middlewareRef" -}}
{{- printf "%s-%s@kubernetescrd" .Release.Namespace (include "matrix-redirect.fullname" .) -}}
{{- end -}}
