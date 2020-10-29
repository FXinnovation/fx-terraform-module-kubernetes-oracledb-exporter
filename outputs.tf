#####
# Global
#####

output "selector_labels" {
  description = "Map of the labels that are used as selectors."
  value       = kubernetes_service.this.*.spec.0.selector
}

output "image_name" {
  description = "Name of the docker image used for the oracledb-exporter container."
  value       = var.image_name
}

output "image_version" {
  description = "Tag of the docker image used for the oracledb-exporter container."
  value       = var.image_version
}

output "image_pull_policy" {
  description = "Image pull policy defined on the oracledb-exporter container."
  value       = var.image_pull_policy
}

output "grafana_dashboards" {
  description = "List of strings representing grafana dashboards under the form of json strings."
  value       = local.grafana_dashboards
}

output "prometheus_alert_groups" {
  description = "List of object representing prometheus alert groups you can import in prometheus to alert you in case of problems."
  value       = local.prometheus_alert_groups
}

#####
# Deployment
#####

output "deployment_name" {
  description = "Name of the deployment created by the module."
  value       = kubernetes_deployment.this.*.metadata.0.name
}

output "deployment_annotations" {
  description = "Map of annotations that are configured on the deployment."
  value       = kubernetes_deployment.this.*.metadata.0.annotations
}

output "deployment_labels" {
  description = "Map of labels that are configured on the deployment."
  value       = kubernetes_deployment.this.*.metadata.0.labels
}

output "deployment_template_annotations" {
  description = "Map of annotations that are configured on the deployment."
  value       = kubernetes_deployment.this.*.spec.0.template.0.metadata.0.annotations
}

output "deployment_template_labels" {
  description = "Map of labels that are configured on the deployment."
  value       = kubernetes_deployment.this.*.spec.0.template.0.metadata.0.labels
}

#####
# Service
#####

output "service_name" {
  description = "Name of the service created by the module."
  value       = kubernetes_service.this.*.metadata.0.name
}

output "service_port" {
  description = "Port number of the service port."
  value       = local.service_port
}

output "service_port_name" {
  description = "Name of the service port."
  value       = "http"
}

output "service_annotations" {
  description = "Map of annotations that are configured on the service."
  value       = kubernetes_service.this.*.metadata.0.annotations
}

output "service_labels" {
  description = "Map of labels that are configured on the service."
  value       = kubernetes_service.this.*.metadata.0.labels
}

#####
# Configmap
#####

output "config_map_name" {
  description = "Name of the config_map created by the module."
  value       = kubernetes_config_map.this.*.metadata.0.name
}

output "config_map_annotations" {
  description = "Map of annotations that are configured on the config_map."
  value       = kubernetes_config_map.this.*.metadata.0.annotations
}

output "config_map_labels" {
  description = "Map of labels that are configured on the config_map."
  value       = kubernetes_config_map.this.*.metadata.0.labels
}

#####
# Secret
#####

output "secret_name" {
  description = "Name of the secret created by the module."
  value       = kubernetes_secret.this.*.metadata.0.name
}

output "secret_annotations" {
  description = "Map of annotations that are configured on the secret."
  value       = kubernetes_secret.this.*.metadata.0.annotations
}

output "secret_labels" {
  description = "Map of labels that are configured on the secret."
  value       = kubernetes_secret.this.*.metadata.0.labels
}

#####
# Namespace
#####

output "namespace" {
  description = "Name of the namespace in which the resources have been deployed."
  value       = kubernetes_deployment.this.*.metadata.0.namespace
}
