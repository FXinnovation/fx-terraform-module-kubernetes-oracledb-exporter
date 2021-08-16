# terraform-module-kubernetes-oracledb-exporter

Terraform module to deploy oracle db exporter

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.0.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.0.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 2.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_config_map.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/config_map) | resource |
| [kubernetes_deployment.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) | resource |
| [kubernetes_secret.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_service.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service) | resource |
| [random_string.selector](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_annotations"></a> [annotations](#input\_annotations) | Additionnal annotations that will be merged on all resources. | `map` | `{}` | no |
| <a name="input_config_map_annotations"></a> [config\_map\_annotations](#input\_config\_map\_annotations) | Additionnal annotations that will be merged for the config map. | `map` | `{}` | no |
| <a name="input_config_map_labels"></a> [config\_map\_labels](#input\_config\_map\_labels) | Additionnal labels that will be merged for the config map. | `map` | `{}` | no |
| <a name="input_config_map_name"></a> [config\_map\_name](#input\_config\_map\_name) | Name of the config map that will be created. | `string` | `"oracledb-exporter"` | no |
| <a name="input_custom_metrics_file"></a> [custom\_metrics\_file](#input\_custom\_metrics\_file) | Path to the custom metrics file. Leave empty if you do not need custom metrics. | `string` | `""` | no |
| <a name="input_data_source_name"></a> [data\_source\_name](#input\_data\_source\_name) | data\_source\_name that will be used by the oracledb-exporter. | `string` | n/a | yes |
| <a name="input_default_metrics_file"></a> [default\_metrics\_file](#input\_default\_metrics\_file) | Path to the default metrics file. Leave empty to use the default one. | `string` | `""` | no |
| <a name="input_deployment_annotations"></a> [deployment\_annotations](#input\_deployment\_annotations) | Additionnal annotations that will be merged on the deployment. | `map` | `{}` | no |
| <a name="input_deployment_labels"></a> [deployment\_labels](#input\_deployment\_labels) | Additionnal labels that will be merged on the deployment. | `map` | `{}` | no |
| <a name="input_deployment_name"></a> [deployment\_name](#input\_deployment\_name) | Name of the deployment that will be create. | `string` | `"oracledb-exporter"` | no |
| <a name="input_deployment_template_annotations"></a> [deployment\_template\_annotations](#input\_deployment\_template\_annotations) | Additionnal annotations that will be merged on the deployment template. | `map` | `{}` | no |
| <a name="input_deployment_template_labels"></a> [deployment\_template\_labels](#input\_deployment\_template\_labels) | Additionnal labels that will be merged on the deployment template. | `map` | `{}` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | Name of the docker image to use. | `string` | `"iamseth/oracledb_exporter"` | no |
| <a name="input_image_pull_policy"></a> [image\_pull\_policy](#input\_image\_pull\_policy) | Image pull policy on the main container. | `string` | `"IfNotPresent"` | no |
| <a name="input_image_version"></a> [image\_version](#input\_image\_version) | Tag of the docker image to use. | `string` | `"0.2.6a"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Additionnal labels that will be merged on all resources. | `map` | `{}` | no |
| <a name="input_log_level"></a> [log\_level](#input\_log\_level) | Log level to set on the exporter. Valid levels: [debug, info, warn, error, fatal]. | `string` | `""` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace in which the module will be deployed. | `string` | `"default"` | no |
| <a name="input_prometheus_alert_groups_rules_annotations"></a> [prometheus\_alert\_groups\_rules\_annotations](#input\_prometheus\_alert\_groups\_rules\_annotations) | Map of strings that will be merge on all prometheus alert groups rules annotations. | `map` | `{}` | no |
| <a name="input_prometheus_alert_groups_rules_labels"></a> [prometheus\_alert\_groups\_rules\_labels](#input\_prometheus\_alert\_groups\_rules\_labels) | Map of strings that will be merge on all prometheus alert groups rules labels. | `map` | `{}` | no |
| <a name="input_query_timeout"></a> [query\_timeout](#input\_query\_timeout) | Amount of time in seconds before the exporter should timeout the query. Note: This time MUST be less then the scrape\_timeout of prometheus. | `string` | `""` | no |
| <a name="input_replicas"></a> [replicas](#input\_replicas) | Number of replicas to deploy. | `number` | `1` | no |
| <a name="input_secret_annotations"></a> [secret\_annotations](#input\_secret\_annotations) | Additionnal annotations that will be merged for the secret. | `map` | `{}` | no |
| <a name="input_secret_labels"></a> [secret\_labels](#input\_secret\_labels) | Additionnal labels that will be merged for the secret. | `map` | `{}` | no |
| <a name="input_secret_name"></a> [secret\_name](#input\_secret\_name) | Name of the secret that will be created. | `string` | `"oracledb-exporter"` | no |
| <a name="input_service_annotations"></a> [service\_annotations](#input\_service\_annotations) | Additionnal annotations that will be merged for the service. | `map` | `{}` | no |
| <a name="input_service_labels"></a> [service\_labels](#input\_service\_labels) | Additionnal labels that will be merged for the service. | `map` | `{}` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Name of the service that will be create | `string` | `"oracledb-exporter"` | no |
| <a name="input_tns_entry"></a> [tns\_entry](#input\_tns\_entry) | Name ofthe TNS entry to use in the tnsnames.ora file. Leave empty if you do not need this. | `string` | `""` | no |
| <a name="input_tnsnames_file"></a> [tnsnames\_file](#input\_tnsnames\_file) | PAth of the oracle tnsnames.ora file. Leave empty if you do not need this. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_config_map"></a> [config\_map](#output\_config\_map) | Config\_map created by the module. |
| <a name="output_deployment"></a> [deployment](#output\_deployment) | Deployment created by the module. |
| <a name="output_grafana_dashboards"></a> [grafana\_dashboards](#output\_grafana\_dashboards) | List of strings representing grafana dashboards under the form of json strings. |
| <a name="output_image_name"></a> [image\_name](#output\_image\_name) | Name of the docker image used for the oracledb-exporter container. |
| <a name="output_image_pull_policy"></a> [image\_pull\_policy](#output\_image\_pull\_policy) | Image pull policy defined on the oracledb-exporter container. |
| <a name="output_image_version"></a> [image\_version](#output\_image\_version) | Tag of the docker image used for the oracledb-exporter container. |
| <a name="output_prometheus_alert_groups"></a> [prometheus\_alert\_groups](#output\_prometheus\_alert\_groups) | List of object representing prometheus alert groups you can import in prometheus to alert you in case of problems. |
| <a name="output_secret"></a> [secret](#output\_secret) | Secret created by the module. |
| <a name="output_service"></a> [service](#output\_service) | Service created by the module. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
