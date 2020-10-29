#####
# Locals
#####

locals {
  labels = {
    version    = var.image_version
    component  = "exporter"
    part-of    = "monitoring"
    managed-by = "terraform"
    name       = "oracledb-exporter"
  }
  port               = 9161
  service_port       = 80
  grafana_dashboards = [file("${path.module}/templates/grafana-dashboards/oracle.json")]
  prometheus_alert_groups = [
    {
      "name" = "oracledb-exporter"
      "rules" = [
        {
          "alert" = "OracledbExpoterScrapeErrors"
          "expr"  = "oracledb_exporter_last_scrape_error > 0"
          "for"   = "5m"
          "labels" = merge(
            {
              "severity" = "critical"
              "urgency"  = "2"
            },
            var.prometheus_alert_groups_rules_labels
          )
          "annotations" = merge(
            {
              "summary"     = "Oracle DB - Scrape Error on {{ $labels.instance }}",
              "description" = "Oracle DB:\n {{ $labels.instance }} scrape errors.\nLabels:\n{{ $labels }}"
            },
            var.prometheus_alert_groups_rules_annotations
          )
        },
        {
          "alert" = "OracledbExpoterScrapeDurationError"
          "expr"  = "deriv(oracledb_exporter_last_scrape_duration_seconds[2m]) > 0.2 and oracledb_exporter_last_scrape_duration_seconds > 10"
          "for"   = "5m"
          "labels" = merge(
            {
              "severity" = "warning"
              "urgency"  = "3"
            },
            var.prometheus_alert_groups_rules_labels
          )
          "annotations" = merge(
            {
              "summary"     = "Oracle DB - Scrape Duration Error on {{ $labels.instance }}",
              "description" = "Oracle DB:\n {{ $labels.instance }} scrape durations is too high.\nLabels:\n{{ $labels }}"
            },
            var.prometheus_alert_groups_rules_annotations
          )
        }
      ]
    },
    {
      "name" = "oracledb"
      "rules" = [
        {
          "alert" = "OracledbDatabaseDown"
          "expr"  = "oracledb_up < 1"
          "for"   = "1m"
          "labels" = merge(
            {
              "severity" = "critical"
              "urgency"  = "2"
            },
            var.prometheus_alert_groups_rules_labels
          )
          "annotations" = merge(
            {
              "summary"     = "Oracle DB - Database Down on {{ $labels.instance }}"
              "description" = "Oracle DB:\n {{ $labels.instance }} database is down.\nLabels:\n{{ $labels }}"
            },
            var.prometheus_alert_groups_rules_annotations
          )
        },
        {
          "alert" = "OracledbTablespaceLowWarning"
          "expr"  = "((oracledb_tablespace_bytes - oracledb_tablespace_free) / oracledb_tablespace_max_bytes) * 100 > 75"
          "for"   = "15m"
          "labels" = merge(
            {
              "severity" = "warning"
              "urgency"  = "3"
            },
            var.prometheus_alert_groups_rules_labels
          )
          "annotations" = merge(
            {
              "summary"     = "Oracle DB - Tablespace {{ $labels.tablespace }} is getting low on {{ $labels.instance }}"
              "description" = "Oracle DB:\n Tablespace {{ $labels.tablespace }} on {{ $labels.instance }} database is at {{ $value }}%\nLabels:\n{{ $labels }}"
            },
            var.prometheus_alert_groups_rules_annotations
          )
        },
        {
          "alert" = "OracledbTablespaceLowCritical"
          "expr"  = "((oracledb_tablespace_bytes - oracledb_tablespace_free) / oracledb_tablespace_max_bytes) * 100 > 85"
          "for"   = "15m"
          "labels" = merge(
            {
              "severity" = "critical"
              "urgency"  = "3"
            },
            var.prometheus_alert_groups_rules_labels
          )
          "annotations" = merge(
            {
              "summary"     = "Oracle DB - Tablespace {{ $labels.tablespace }} is low on {{ $labels.instance }}"
              "description" = "Oracle DB:\n Tablespace {{ $labels.tablespace }} on {{ $labels.instance }} database is at {{ $value }}%\nLabels:\n{{ $labels }}"
            },
            var.prometheus_alert_groups_rules_annotations
          )
        },
        {
          "alert" = "OracledbAsmDiskGroupDataLowWarning"
          "expr"  = "100 - ((oracledb_asm_diskgroup_free{name=\"DATA\"} / oracledb_asm_diskgroup_total{name=\"DATA\"}) * 100) > 75"
          "for"   = "15m"
          "labels" = merge(
            {
              "severity" = "warning"
              "urgency"  = "3"
            },
            var.prometheus_alert_groups_rules_labels
          )
          "annotations" = merge(
            {
              "summary"     = "Oracle DB - ASM Disk Group DATA is getting low on {{ $labels.instance }}"
              "description" = "Oracle DB:\n ASM disk group DATA on {{ $labels.instance }} database is at {{ $value }}%\nLabels:\n{{ $labels }}"
            },
            var.prometheus_alert_groups_rules_annotations
          )
        },
        {
          "alert" = "OracledbAsmDiskGroupDataLowCritical"
          "expr"  = "100 - ((oracledb_asm_diskgroup_free{name=\"DATA\"} / oracledb_asm_diskgroup_total{name=\"DATA\"}) * 100) > 85"
          "for"   = "15m"
          "labels" = merge(
            {
              "severity" = "critical"
              "urgency"  = "3"
            },
            var.prometheus_alert_groups_rules_labels
          )
          "annotations" = merge(
            {
              "summary"     = "Oracle DB - ASM Disk Group DATA is low on {{ $labels.instance }}"
              "description" = "Oracle DB:\n ASM disk group DATA on {{ $labels.instance }} database is at {{ $value }}%\nLabels:\n{{ $labels }}"
            },
            var.prometheus_alert_groups_rules_annotations
          )
        },
        {
          "alert" = "OracledbAsmDiskGroupArchLowWarning"
          "expr"  = "100 - ((oracledb_asm_diskgroup_free{name=\"ARCH\"} / oracledb_asm_diskgroup_total{name=\"ARCH\"}) * 100) > 75"
          "for"   = "15m"
          "labels" = merge(
            {
              "severity" = "warning"
              "urgency"  = "3"
            },
            var.prometheus_alert_groups_rules_labels
          )
          "annotations" = merge(
            {
              "summary"     = "Oracle DB - ASM Disk Group ARCH is getting low on {{ $labels.instance }}"
              "description" = "Oracle DB:\n ASM disk group ARCH on {{ $labels.instance }} database is at {{ $value }}%\nLabels:\n{{ $labels }}"
            },
            var.prometheus_alert_groups_rules_annotations
          )
        },
        {
          "alert" = "OracledbAsmDiskGroupArchLowCritical"
          "expr"  = "100 - ((oracledb_asm_diskgroup_free{name=\"ARCH\"} / oracledb_asm_diskgroup_total{name=\"ARCH\"}) * 100) > 85"
          "for"   = "15m"
          "labels" = merge(
            {
              "severity" = "critical"
              "urgency"  = "3"
            },
            var.prometheus_alert_groups_rules_labels
          )
          "annotations" = merge(
            {
              "summary"     = "Oracle DB - ASM Disk Group ARCH is low on {{ $labels.instance }}"
              "description" = "Oracle DB:\n ASM disk group ARCH on {{ $labels.instance }} database is at {{ $value }}%\nLabels:\n{{ $labels }}"
            },
            var.prometheus_alert_groups_rules_annotations
          )
        }
      ]
    }
  ]
}

#####
# Randoms
#####

resource "random_string" "selector" {
  special = false
  upper   = false
  number  = false
  length  = 8
}

#####
# Deployment
#####

resource "kubernetes_deployment" "this" {
  metadata {
    name      = var.deployment_name
    namespace = var.namespace
    annotations = merge(
      var.annotations,
      var.deployment_annotations
    )
    labels = merge(
      {
        instance = var.deployment_name
      },
      local.labels,
      var.labels,
      var.deployment_labels
    )
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app    = "oracledb-exporter"
        random = random_string.selector.result
      }
    }
    template {
      metadata {
        annotations = merge(
          {
            "configuration/hash" = sha1(jsonencode(element(concat(kubernetes_config_map.this.*.data, list("")), 0)))
          },
          var.annotations,
          var.deployment_template_annotations
        )
        labels = merge(
          {
            instance = var.deployment_name
            app      = "oracledb-exporter"
            random   = random_string.selector.result
          },
          local.labels,
          var.labels,
          var.deployment_template_labels
        )
      }
      spec {
        container {
          name              = "oracledb-exporter"
          image             = "${var.image_name}:${var.image_version}"
          image_pull_policy = var.image_pull_policy

          args = concat(
            "" != var.custom_metrics_file ? ["-custom.metrics", "/config/custom-metrics.toml"] : [],
            "" != var.default_metrics_file ? ["-default.metrics", "/config/default-metrics.toml"] : [],
            "" != var.log_level ? ["-log.level", var.log_level] : [],
            "" != var.query_timeout ? ["-query.timeout", var.query_timeout] : []
          )

          env {
            name = "DATA_SOURCE_NAME"
            value_from {
              secret_key_ref {
                name = element(concat(kubernetes_secret.this.*.metadata.0.name, [""]), 0)
                key  = "data_source_name"
              }
            }
          }

          readiness_probe {
            http_get {
              path   = "/"
              port   = local.port
              scheme = "HTTP"
            }

            timeout_seconds       = 5
            period_seconds        = 5
            success_threshold     = 1
            failure_threshold     = 35
            initial_delay_seconds = 60
          }

          liveness_probe {
            http_get {
              path   = "/"
              port   = local.port
              scheme = "HTTP"
            }

            timeout_seconds       = 5
            period_seconds        = 10
            success_threshold     = 1
            failure_threshold     = 3
            initial_delay_seconds = 90
          }

          port {
            name           = "http"
            container_port = local.port
            protocol       = "TCP"
          }

          resources {
            requests {
              memory = "128Mi"
              cpu    = "5m"
            }
            limits {
              memory = "256Mi"
              cpu    = "50m"
            }
          }

          volume_mount {
            name       = "default-metrics"
            mount_path = "/config/default-metrics.toml"
            sub_path   = "default-metrics.toml"
          }

          volume_mount {
            name       = "custom-metrics"
            mount_path = "/config/custom-metrics.toml"
            sub_path   = "custom-metrics.toml"
          }
        }

        volume {
          name = "default-metrics"
          config_map {
            name = element(concat(kubernetes_config_map.this.*.metadata.0.name, [""]), 0)
            items {
              key  = "default-metrics.toml"
              path = "default-metrics.toml"
            }
          }
        }

        volume {
          name = "custom-metrics"
          config_map {
            name = element(concat(kubernetes_config_map.this.*.metadata.0.name, [""]), 0)
            items {
              key  = "custom-metrics.toml"
              path = "custom-metrics.toml"
            }
          }
        }
      }
    }
  }
}

#####
# Service
#####

resource "kubernetes_service" "this" {
  metadata {
    name      = var.service_name
    namespace = var.namespace
    annotations = merge(
      {
        "prometheus.io/scrape" = "true"
      },
      var.annotations,
      var.service_annotations
    )
    labels = merge(
      {
        instance = var.service_name
      },
      local.labels,
      var.labels,
      var.service_labels
    )
  }

  spec {
    selector = {
      random = random_string.selector.result
      app    = "oracledb-exporter"
    }
    type = "ClusterIP"
    port {
      port        = local.service_port
      target_port = "http"
      protocol    = "TCP"
      name        = "http"
    }
  }
}

#####
# ConfigMap
#####

resource "kubernetes_config_map" "this" {
  metadata {
    name      = var.config_map_name
    namespace = var.namespace
    annotations = merge(
      var.annotations,
      var.config_map_annotations
    )
    labels = merge(
      {
        instance = var.config_map_name
      },
      local.labels,
      var.labels,
      var.config_map_labels
    )
  }

  data = {
    "custom-metrics.toml"  = "" != var.custom_metrics_file ? file(var.custom_metrics_file) : ""
    "default-metrics.toml" = "" != var.default_metrics_file ? file(var.default_metrics_file) : ""
  }
}

#####
# Secret
#####

resource "kubernetes_secret" "this" {
  metadata {
    name      = var.secret_name
    namespace = var.namespace
    annotations = merge(
      var.annotations,
      var.secret_annotations
    )
    labels = merge(
      {
        instance = var.secret_name
      },
      local.labels,
      var.labels,
      var.secret_labels
    )
  }

  data = {
    data_source_name = var.data_source_name
  }

  type = "Opaque"
}
