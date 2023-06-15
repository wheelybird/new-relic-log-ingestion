output "function_arn" {
  value       = aws_lambda_function.ingestion_function.arn
  description = "Log ingestion lambda function ARN"
}
