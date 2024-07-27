{{/* - Removed for rework
  {{/*
  Customize Name Function

  Argument 1: List of key:Key1,value:Value1 Pairs
  Argument 2: Default "Key: Value" Pairs

  Example include: {{- include "labels" (list .customLabelsList (print "app: " $.Chart.Name)) | indent 4 }}

  */}}

  {{- define "labels_old" }}
  {{- $labelList := index . 0 }}
  {{- $defaultValue := index . 1 }}
  {{- if $labelList }}
  {{- range $labelList }}
  {{ .key }}: {{ .value }}
  {{- end }}
  {{- else }}
  {{ $defaultValue }}
  {{- end }}
  {{- end }}
*/}}

{{/*
Customize Name Function

Argument 1: List of key:Key1,value:Value1 Pairs
Argument 2: Default Key "Key: Value" Pairs

Example default: {{- $labelDefault := list (dict "key" "app" "value" $.Chart.Name) (dict "key" "app2" "value" $.Chart.Name) }}
Example include: {{- include "labels" (list .customLabelsList $labelDefault) | indent 4 }}

*/}}

{{- define "labels" }}
{{- $labelList := index . 0 }}
{{- $defaultList := "" }}
{{- if index . 1 }}
{{- $defaultList = index . 1 }}
{{- end }}
{{- if $labelList }}
{{- range $labelList }}
{{ .key }}: {{ .value }}
{{- end }}
{{- else if $defaultList }}
{{- range $defaultList }}
{{ .key }}: {{ .value }}
{{- end }}
{{- end }}
{{- end }}

{{/* ------------------------------------------------------------ */}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "common.names.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}
