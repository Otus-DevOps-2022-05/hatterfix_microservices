{{- define "comment.ver" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name}}
{{- end -}}
