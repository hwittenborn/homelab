{{/*
Name of the secret shared between litellm and postgres.
*/}}
{{- define "litellm.secretName" -}}
{{- printf "%s-secrets" .Release.Name }}
{{- end }}

{{/*
Name of the TLS secret for the ingress.
*/}}
{{- define "litellm.tlsSecretName" -}}
{{- printf "%s-tls" .Release.Name }}
{{- end }}
