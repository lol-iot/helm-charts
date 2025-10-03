{{- define "netbird.dashboard.fullname" -}}
{{ include "netbird.fullname" . | trunc 55 | trimSuffix "-" }}-dashboard
{{- end }}

{{- define "netbird.dashboard.matchLabels" -}}
app.kubernetes.io/name: {{ include "netbird.dashboard.fullname" . }}
app: {{ include "netbird.dashboard.fullname" . }}
{{- end }}

{{- define "netbird.dashboard.labels" -}}
{{ include "netbird.labels" . }}
{{ include "netbird.dashboard.matchLabels" . }}
{{- end }}
