{{- define "post.ver" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name}}
{{- end -}}
