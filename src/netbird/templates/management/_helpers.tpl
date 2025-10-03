{{- define "netbird.management.fullname" -}}
{{ include "netbird.fullname" . | trunc 55 | trimSuffix "-" }}-management
{{- end }}

{{- define "netbird.management.matchLabels" -}}
app.kubernetes.io/name: {{ include "netbird.management.fullname" . }}
app: {{ include "netbird.management.fullname" . }}
{{- end }}

{{- define "netbird.management.labels" -}}
{{ include "netbird.labels" . }}
{{ include "netbird.management.matchLabels" . }}
{{- end }}
