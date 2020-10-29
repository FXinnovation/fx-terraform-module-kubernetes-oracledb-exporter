#####
# Global
#####

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

output "deployment" {
  description = "Deployment created by the module."
  value       = kubernetes_deployment.this
}

#####
# Service
#####

output "service" {
  description = "Service created by the module."
  value       = kubernetes_service.this
}

#####
# Configmap
#####

output "config_map" {
  description = "Config_map created by the module."
  value       = kubernetes_config_map.this
}

#####
# Secret
#####

output "secret" {
  description = "Secret created by the module."
  value       = kubernetes_secret.this
}
