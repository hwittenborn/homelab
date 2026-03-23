{{/*
Name of the secret shared between kutt and postgres.
*/}}
{{- define "kutt.secretName" -}}
{{- printf "%s-secrets" .Release.Name }}
{{- end }}

{{/*
Name of the TLS secret for the ingress.
*/}}
{{- define "kutt.tlsSecretName" -}}
{{- printf "%s-tls" .Release.Name }}
{{- end }}
