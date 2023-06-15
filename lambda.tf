resource "aws_lambda_function" "ingestion_function" {
  depends_on = [
    aws_iam_role.lambda_role,
    aws_cloudwatch_log_group.lambda_logs,
    null_resource.build_lambda,
  ]

  function_name = var.service_name
  description   = "Sends log data from CloudWatch Logs to New Relic Infrastructure (Cloud integrations) and New Relic Logging"
  role = (var.function_role != null
    ? var.function_role
    : aws_iam_role.lambda_role.0.arn
  )
  runtime     = "python${var.python_runtime_version}"
  filename    = "${local.build_dir}/${local.service_name}"
  handler     = "function.lambda_handler"
  memory_size = var.memory_size
  timeout     = var.timeout

  environment {
    variables = {
      LICENSE_KEY     = var.nr_license_key
      LOGGING_ENABLED = var.nr_logging_enabled ? "True" : "False"
      INFRA_ENABLED   = var.nr_infra_logging ? "True" : "False"
      NR_TAGS         = var.nr_tags
    }
  }

  tags = local.tags
}

resource "aws_lambda_permission" "log_invoke_permission" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.ingestion_function.function_name
  principal     = "logs.${local.aws_region}.amazonaws.com"
  source_arn    = "arn:${local.aws_partition}:logs:${local.aws_region}:${local.aws_account_id}:log-group:*"
}
