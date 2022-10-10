{{- define "ui.ver" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name}}
{{- end -}}
