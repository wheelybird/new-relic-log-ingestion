output "function_arn" {
  value       = aws_lambda_function.ingestion_function.arn
  description = "Log ingestion lambda function ARN"
}

output "function_name" {
  value       = function_name.ingestion_function.function_name
  description = "Log ingestion lambda function name"
}
