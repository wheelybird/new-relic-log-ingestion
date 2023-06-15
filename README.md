## New Relic log ingestion module

This is a modified version of the Terraform module provided at [https://github.com/newrelic/aws-log-ingestion](https://github.com/newrelic/aws-log-ingestion).

This version builds the log ingestor lambda without using Docker; the original version uses Docker in host network mode, which isn't supported by BitBuket's CI pipelines.   
Instead this uses `pipenv` to build the lambda directly on the host.

The Terraform will provision the lambda and associated resources.  To forward logs to New Relic you'll need to add triggers to the lambda using CloudWatch log groups as the source event.



## Requirements

`pipenv` installed locally

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.lambda_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_role.lambda_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.lambda_log_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.ingestion_function](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_permission.log_invoke_permission](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [null_resource.build_lambda](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.lambda_assume_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_function_role"></a> [function\_role](#input\_function\_role) | IAM Role name that this function will assume. Should provide the AWSLambdaBasicExecutionRole policy. If not specified, an appropriate Role will be created. | `string` | `null` | no |
| <a name="input_lambda_log_retention_in_days"></a> [lambda\_log\_retention\_in\_days](#input\_lambda\_log\_retention\_in\_days) | Number of days to keep logs from the lambda for | `number` | `7` | no |
| <a name="input_memory_size"></a> [memory\_size](#input\_memory\_size) | Memory size for the New Relic Log Ingestion Lambda function | `number` | `128` | no |
| <a name="input_nr_infra_logging"></a> [nr\_infra\_logging](#input\_nr\_infra\_logging) | Determines if logs are forwarded to New Relic Infrastructure | `bool` | `true` | no |
| <a name="input_nr_license_key"></a> [nr\_license\_key](#input\_nr\_license\_key) | Your NewRelic license key. | `string` | n/a | yes |
| <a name="input_nr_logging_enabled"></a> [nr\_logging\_enabled](#input\_nr\_logging\_enabled) | Determines if logs are forwarded to New Relic Logging | `bool` | `false` | no |
| <a name="input_nr_tags"></a> [nr\_tags](#input\_nr\_tags) | Additional tags added to the logs | `string` | n/a | yes |
| <a name="input_permissions_boundary"></a> [permissions\_boundary](#input\_permissions\_boundary) | IAM Role Permissions Boundary (optional) | `string` | `null` | no |
| <a name="input_python_runtime_version"></a> [python\_runtime\_version](#input\_python\_runtime\_version) | The lambda Python runtime version | `string` | `"3.9"` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The name of the lambda function and related resources | `string` | `"newrelic-log-ingestion"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to add to the resources created | `map(string)` | `{}` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | Timeout for the New Relic Log Ingestion Lambda function | `number` | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_function_arn"></a> [function\_arn](#output\_function\_arn) | Log ingestion lambda function ARN |
| <a name="output_function_name"></a> [function\_name](#output\_function\_name) | Log ingestion lambda function name |
