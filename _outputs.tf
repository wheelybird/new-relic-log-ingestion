output "function_arn" {
  value       = aws_lambda_function.ingestion_function.arn
  description = "Log ingestion lambda function ARN"
}

output "function_name" {
  value       = aws_lambda_function.ingestion_function.name
  description = "Log ingestion lambda function name"
}
