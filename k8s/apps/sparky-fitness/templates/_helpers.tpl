{{- define "sparky-fitness.secretName" -}}
{{- printf "%s-secrets" .Release.Name }}
{{- end }}

{{- define "sparky-fitness.tlsSecretName" -}}
{{- printf "%s-tls" .Release.Name }}
{{- end }}
