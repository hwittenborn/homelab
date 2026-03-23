{{- define "secrets-bootstrap.wait-rbac" -}}
apiVersion: v1
kind: ServiceAccount
metadata:
  name: {{ include "secrets-bootstrap.waitServiceAccountName" . }}
---
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: {{ include "secrets-bootstrap.waitServiceAccountName" . }}
rules:
  - apiGroups: ["external-secrets.io"]
    resources: ["externalsecrets"]
    verbs: ["get", "list", "watch"]
  - apiGroups: [""]
    resources: ["secrets"]
    resourceNames: [{{ include "secrets-bootstrap.secretName" . | quote }}]
    verbs: ["get"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: {{ include "secrets-bootstrap.waitServiceAccountName" . }}
subjects:
  - kind: ServiceAccount
    name: {{ include "secrets-bootstrap.waitServiceAccountName" . }}
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: {{ include "secrets-bootstrap.waitServiceAccountName" . }}
{{- end -}}
