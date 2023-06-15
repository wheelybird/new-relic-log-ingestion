resource "aws_iam_role" "lambda_role" {
  count = var.function_role == null ? 1 : 0

  name                 = var.service_name
  assume_role_policy   = data.aws_iam_policy_document.lambda_assume_policy.json
  permissions_boundary = var.permissions_boundary

  tags = local.tags
}

resource "aws_iam_role_policy_attachment" "lambda_log_policy" {
  count = var.function_role == null ? 1 : 0

  role       = aws_iam_role.lambda_role.0.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_cloudwatch_log_group" "lambda_logs" {
  name              = "/aws/lambda/${var.service_name}"
  retention_in_days = var.lambda_log_retention_in_days

  tags = local.tags
}
