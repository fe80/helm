{{- define "broker.fullname" -}}
{{- printf "%s" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "broker.peers" -}}
{{- $count := .Values.broker.clusterSize | int -}}
{{- $last := sub $count 1 -}}
{{- $name := include "broker.fullname" . -}}
{{- range $i, $e := until $count -}}
{{- if eq $last $i -}}
{{ printf "nats://%s-%d.%s-ss.%s.svc:5222" $name $i $name  $.Values.namespace }}
{{- else -}}
{{ printf "nats://%s-%d.%s-ss.%s.svc:5222," $name  $i $name $.Values.namespace }}
{{- end -}}
{{- end -}}
{{- end }}
