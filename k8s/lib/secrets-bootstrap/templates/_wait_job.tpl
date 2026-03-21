{{- define "secrets-bootstrap.wait-job" -}}
apiVersion: batch/v1
kind: Job
metadata:
  name: {{ include "secrets-bootstrap.waitJobName" . }}
  annotations:
    helm.sh/hook: post-install,post-upgrade
    helm.sh/hook-delete-policy: before-hook-creation,hook-succeeded
spec:
  template:
    spec:
      serviceAccountName: {{ include "secrets-bootstrap.waitServiceAccountName" . }}
      restartPolicy: Never
      containers:
        - name: wait
          image: bitnami/kubectl:latest
          command:
            - sh
            - -ec
            - |
              kubectl wait \
                --namespace "${POD_NAMESPACE}" \
                --for=condition=Ready \
                "externalsecret/${SECRET_NAME}" \
                --timeout="${TIMEOUT_SECONDS}s"

              kubectl get secret \
                --namespace "${POD_NAMESPACE}" \
                "${SECRET_NAME}" >/dev/null
          env:
            - name: SECRET_NAME
              value: {{ include "secrets-bootstrap.secretName" . | quote }}
            - name: TIMEOUT_SECONDS
              value: {{ include "secrets-bootstrap.timeoutSeconds" . | quote }}
            - name: POD_NAMESPACE
              valueFrom:
                fieldRef:
                  fieldPath: metadata.namespace
{{- end -}}
