{{- define "netbird.relay.fullname" -}}
{{ include "netbird.fullname" . | trunc 55 | trimSuffix "-" }}-relay
{{- end }}

{{- define "netbird.relay.matchLabels" -}}
app.kubernetes.io/name: {{ include "netbird.relay.fullname" . }}
app: {{ include "netbird.relay.fullname" . }}
{{- end }}

{{- define "netbird.relay.labels" -}}
{{ include "netbird.labels" . }}
{{ include "netbird.relay.matchLabels" . }}
{{- end }}
