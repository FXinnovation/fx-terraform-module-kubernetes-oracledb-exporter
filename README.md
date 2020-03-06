# terraform-module-kubernetes-oracledb-exporter

Terraform module to deploy oracle db exporter

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| kubernetes | >= 1.10.0 |
| random | >= 2.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
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
| enabled | Whether or not to enable this module. | `bool` | `true` | no |
| image\_name | Name of the docker image to use. | `string` | `"iamseth/oracledb_exporter"` | no |
| image\_pull\_policy | Image pull policy on the main container. | `string` | `"IfNotPresent"` | no |
| image\_version | Tag of the docker image to use. | `string` | `"latest"` | no |
| labels | Additionnal labels that will be merged on all resources. | `map` | `{}` | no |
| namespace | Namespace in which the module will be deployed. | `string` | `"default"` | no |
| prometheus\_alert\_groups\_rules\_annotations | Map of strings that will be merge on all prometheus alert groups rules annotations. | `map` | `{}` | no |
| prometheus\_alert\_groups\_rules\_labels | Map of strings that will be merge on all prometheus alert groups rules labels. | `map` | `{}` | no |
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
| config\_map\_annotations | Map of annotations that are configured on the config\_map. |
| config\_map\_labels | Map of labels that are configured on the config\_map. |
| config\_map\_name | Name of the config\_map created by the module. |
| deployment\_annotations | Map of annotations that are configured on the deployment. |
| deployment\_labels | Map of labels that are configured on the deployment. |
| deployment\_name | Name of the deployment created by the module. |
| deployment\_template\_annotations | Map of annotations that are configured on the deployment. |
| deployment\_template\_labels | Map of labels that are configured on the deployment. |
| grafana\_dashboards | List of strings representing grafana dashboards under the form of json strings. |
| image\_name | Name of the docker image used for the oracledb-exporter container. |
| image\_pull\_policy | Image pull policy defined on the oracledb-exporter container. |
| image\_version | Tag of the docker image used for the oracledb-exporter container. |
| namespace | Name of the namespace in which the resources have been deployed. |
| prometheus\_alert\_groups | List of object representing prometheus alert groups you can import in prometheus to alert you in case of problems. |
| secret\_annotations | Map of annotations that are configured on the secret. |
| secret\_labels | Map of labels that are configured on the secret. |
| secret\_name | Name of the secret created by the module. |
| selector\_labels | Map of the labels that are used as selectors. |
| service\_annotations | Map of annotations that are configured on the service. |
| service\_labels | Map of labels that are configured on the service. |
| service\_name | Name of the service created by the module. |
| service\_port | Port number of the service port. |
| service\_port\_name | Name of the service port. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
