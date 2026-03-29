{{- define "doppler-store" -}}
apiVersion: external-secrets.io/v1
kind: ClusterSecretStore
metadata:
  name: doppler-secrets-{{ .name }}
spec:
  provider:
    doppler:
      auth:
        secretRef:
          dopplerToken:
            name: doppler-token
            key: dopplerToken
            namespace: external-secrets
      project: homelab
      config: secrets_{{ .name }}
{{- end }}
