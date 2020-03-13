#####
# Global
#####

variable "annotations" {
  description = "Additionnal annotations that will be merged on all resources."
  default     = {}
}

variable "enabled" {
  description = "Whether or not to enable this module."
  default     = true
}

variable "labels" {
  description = "Additionnal labels that will be merged on all resources."
  default     = {}
}

variable "namespace" {
  description = "Namespace in which the module will be deployed."
  default     = "default"
}

#####
# Prometheus
#####

variable "prometheus_alert_groups_rules_labels" {
  description = "Map of strings that will be merge on all prometheus alert groups rules labels."
  default     = {}
}

variable "prometheus_alert_groups_rules_annotations" {
  description = "Map of strings that will be merge on all prometheus alert groups rules annotations."
  default     = {}
}

#####
# Application
#####

variable "data_source_name" {
  description = "data_source_name that will be used by the oracledb-exporter."
  type        = string
}

variable "default_metrics_file" {
  description = "Path to the default metrics file. Leave empty to use the default one."
  default     = ""
}

variable "custom_metrics_file" {
  description = "Path to the custom metrics file. Leave empty if you do not need custom metrics."
  default     = ""
}

variable "log_level" {
  description = "Log level to set on the exporter. Valid levels: [debug, info, warn, error, fatal]."
  default     = ""
}

#####
# Deployment
#####

variable "deployment_annotations" {
  description = "Additionnal annotations that will be merged on the deployment."
  default     = {}
}

variable "deployment_labels" {
  description = "Additionnal labels that will be merged on the deployment."
  default     = {}
}

variable "deployment_name" {
  description = "Name of the deployment that will be create."
  default     = "oracledb-exporter"
}

variable "deployment_template_annotations" {
  description = "Additionnal annotations that will be merged on the deployment template."
  default     = {}
}

variable "deployment_template_labels" {
  description = "Additionnal labels that will be merged on the deployment template."
  default     = {}
}

variable "image_name" {
  description = "Name of the docker image to use."
  default     = "iamseth/oracledb_exporter"
}

variable "image_pull_policy" {
  description = "Image pull policy on the main container."
  default     = "IfNotPresent"
}

variable "image_version" {
  description = "Tag of the docker image to use."
  default     = "0.2.6a"
}

variable "replicas" {
  description = "Number of replicas to deploy."
  default     = 1
}

#####
# Service
#####

variable "service_annotations" {
  description = "Additionnal annotations that will be merged for the service."
  default     = {}
}

variable "service_labels" {
  description = "Additionnal labels that will be merged for the service."
  default     = {}
}

variable "service_name" {
  description = "Name of the service that will be create"
  default     = "oracledb-exporter"
}

#####
# Config Map
#####

variable "config_map_annotations" {
  description = "Additionnal annotations that will be merged for the config map."
  default     = {}
}

variable "config_map_labels" {
  description = "Additionnal labels that will be merged for the config map."
  default     = {}
}

variable "config_map_name" {
  description = "Name of the config map that will be created."
  default     = "oracledb-exporter"
}

#####
# Secret
#####

variable "secret_annotations" {
  description = "Additionnal annotations that will be merged for the secret."
  default     = {}
}

variable "secret_labels" {
  description = "Additionnal labels that will be merged for the secret."
  default     = {}
}

variable "secret_name" {
  description = "Name of the secret that will be created."
  default     = "oracledb-exporter"
}
