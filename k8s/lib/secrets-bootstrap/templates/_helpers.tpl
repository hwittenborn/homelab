{{- define "secrets-bootstrap.secretName" -}}
{{- required "secretsBootstrap.secretName is required" .Values.secretsBootstrap.secretName -}}
{{- end }}

{{- define "secrets-bootstrap.refreshInterval" -}}
{{- default "1h" .Values.secretsBootstrap.refreshInterval -}}
{{- end }}

{{- define "secrets-bootstrap.timeoutSeconds" -}}
{{- default 600 .Values.secretsBootstrap.timeoutSeconds -}}
{{- end }}

{{- define "secrets-bootstrap.waitServiceAccountName" -}}
{{- printf "%s-secrets-wait" .Release.Name -}}
{{- end }}

{{- define "secrets-bootstrap.waitJobName" -}}
{{- printf "%s-secrets-wait" .Release.Name -}}
{{- end }}

{{- define "secrets-bootstrap.render" -}}
{{ include "secrets-bootstrap.externalsecret" . }}
---
{{ include "secrets-bootstrap.wait-rbac" . }}
---
{{ include "secrets-bootstrap.wait-job" . }}
{{- end }}
