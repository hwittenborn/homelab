{{/*
Name of the secret shared between listmonk and postgres.
*/}}
{{- define "listmonk.secretName" -}}
{{- printf "%s-secrets" .Release.Name }}
{{- end }}

{{/*
Name of the TLS secret for the private ingress.
*/}}
{{- define "listmonk.privateTlsSecretName" -}}
{{- printf "%s-private-tls" .Release.Name }}
{{- end }}

{{/*
Name of the TLS secret for the public ingress.
*/}}
{{- define "listmonk.publicTlsSecretName" -}}
{{- printf "%s-public-tls" .Release.Name }}
{{- end }}
