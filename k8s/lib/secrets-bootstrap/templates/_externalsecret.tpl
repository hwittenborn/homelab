{{- define "secrets-bootstrap.externalsecret" -}}
apiVersion: external-secrets.io/v1
kind: ExternalSecret
metadata:
  name: {{ include "secrets-bootstrap.secretName" . }}
spec:
  refreshInterval: {{ include "secrets-bootstrap.refreshInterval" . | quote }}
  secretStoreRef:
    name: bitwarden-cluster-store
    kind: ClusterSecretStore
  target:
    name: {{ include "secrets-bootstrap.secretName" . }}
    creationPolicy: Owner
  data:
{{- range .Values.secretsBootstrap.data }}
    - secretKey: {{ .secretKey }}
      remoteRef:
        key: {{ .remoteKey | quote }}
{{- end }}
{{- end -}}
