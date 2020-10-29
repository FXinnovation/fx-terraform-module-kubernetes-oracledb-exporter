# terraform-module-kubernetes-oracledb-exporter

Terraform module to deploy oracle db exporter

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| kubernetes | >= 1.10.0 |
| random | >= 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| kubernetes | >= 1.10.0 |
| random | >= 2.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| annotations | Additionnal annotations that will be merged on all resources. | `map` | `{}` | no |
| config\_map\_annotations | Additionnal annotations that will be merged for the config map. | `map` | `{}` | no |
| config\_map\_labels | Additionnal labels that will be merged for the config map. | `map` | `{}` | no |
| config\_map\_name | Name of the config map that will be created. | `string` | `"oracledb-exporter"` | no |
| custom\_metrics\_file | Path to the custom metrics file. Leave empty if you do not need custom metrics. | `string` | `""` | no |
| data\_source\_name | data\_source\_name that will be used by the oracledb-exporter. | `string` | n/a | yes |
| default\_metrics\_file | Path to the default metrics file. Leave empty to use the default one. | `string` | `""` | no |
| deployment\_annotations | Additionnal annotations that will be merged on the deployment. | `map` | `{}` | no |
| deployment\_labels | Additionnal labels that will be merged on the deployment. | `map` | `{}` | no |
| deployment\_name | Name of the deployment that will be create. | `string` | `"oracledb-exporter"` | no |
| deployment\_template\_annotations | Additionnal annotations that will be merged on the deployment template. | `map` | `{}` | no |
| deployment\_template\_labels | Additionnal labels that will be merged on the deployment template. | `map` | `{}` | no |
| image\_name | Name of the docker image to use. | `string` | `"iamseth/oracledb_exporter"` | no |
| image\_pull\_policy | Image pull policy on the main container. | `string` | `"IfNotPresent"` | no |
| image\_version | Tag of the docker image to use. | `string` | `"0.2.6a"` | no |
| labels | Additionnal labels that will be merged on all resources. | `map` | `{}` | no |
| log\_level | Log level to set on the exporter. Valid levels: [debug, info, warn, error, fatal]. | `string` | `""` | no |
| namespace | Namespace in which the module will be deployed. | `string` | `"default"` | no |
| prometheus\_alert\_groups\_rules\_annotations | Map of strings that will be merge on all prometheus alert groups rules annotations. | `map` | `{}` | no |
| prometheus\_alert\_groups\_rules\_labels | Map of strings that will be merge on all prometheus alert groups rules labels. | `map` | `{}` | no |
| query\_timeout | Amount of time in seconds before the exporter should timeout the query. Note: This time MUST be less then the scrape\_timeout of prometheus. | `string` | `""` | no |
| replicas | Number of replicas to deploy. | `number` | `1` | no |
| secret\_annotations | Additionnal annotations that will be merged for the secret. | `map` | `{}` | no |
| secret\_labels | Additionnal labels that will be merged for the secret. | `map` | `{}` | no |
| secret\_name | Name of the secret that will be created. | `string` | `"oracledb-exporter"` | no |
| service\_annotations | Additionnal annotations that will be merged for the service. | `map` | `{}` | no |
| service\_labels | Additionnal labels that will be merged for the service. | `map` | `{}` | no |
| service\_name | Name of the service that will be create | `string` | `"oracledb-exporter"` | no |

## Outputs

| Name | Description |
|------|-------------|
| config\_map | Config\_map created by the module. |
| deployment | Deployment created by the module. |
| grafana\_dashboards | List of strings representing grafana dashboards under the form of json strings. |
| image\_name | Name of the docker image used for the oracledb-exporter container. |
| image\_pull\_policy | Image pull policy defined on the oracledb-exporter container. |
| image\_version | Tag of the docker image used for the oracledb-exporter container. |
| prometheus\_alert\_groups | List of object representing prometheus alert groups you can import in prometheus to alert you in case of problems. |
| secret | Secret created by the module. |
| service | Service created by the module. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
