{{/*
Name of the secret shared between n8n and postgres.
*/}}
{{- define "n8n.secretName" -}}
{{- printf "%s-secrets" .Release.Name }}
{{- end }}

{{/*
Name of the TLS secret for the ingress.
*/}}
{{- define "n8n.tlsSecretName" -}}
{{- printf "%s-tls" .Release.Name }}
{{- end }}
