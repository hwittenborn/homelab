{{- define "rclone-s3.name" -}}
{{- .Chart.Name -}}
{{- end }}

{{- define "rclone-s3.fullname" -}}
{{- .Release.Name -}}
{{- end }}

{{- define "rclone-s3.labels" -}}
app.kubernetes.io/name: {{ include "rclone-s3.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
