{{- define "netbird.signal.fullname" -}}
{{ include "netbird.fullname" . | trunc 55 | trimSuffix "-" }}-signal
{{- end }}

{{- define "netbird.signal.matchLabels" -}}
app.kubernetes.io/name: {{ include "netbird.signal.fullname" . }}
app: {{ include "netbird.signal.fullname" . }}
{{- end }}

{{- define "netbird.signal.labels" -}}
{{ include "netbird.labels" . }}
{{ include "netbird.signal.matchLabels" . }}
{{- end }}
