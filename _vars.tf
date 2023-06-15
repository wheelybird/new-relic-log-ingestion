variable "service_name" {
  type        = string
  description = "The name of the lambda function and related resources"
  default     = "newrelic-log-ingestion"
}

variable "nr_license_key" {
  type        = string
  description = "Your NewRelic license key."
  sensitive   = true
}

variable "nr_logging_enabled" {
  type        = bool
  description = "Determines if logs are forwarded to New Relic Logging"
  default     = false
}

variable "nr_infra_logging" {
  type        = bool
  description = "Determines if logs are forwarded to New Relic Infrastructure"
  default     = true
}

variable "nr_tags" {
  type        = string
  description = "Additional tags added to the logs"
  sensitive   = false
}

variable "memory_size" {
  type        = number
  description = "Memory size for the New Relic Log Ingestion Lambda function"
  default     = 128
}

variable "timeout" {
  type        = number
  description = "Timeout for the New Relic Log Ingestion Lambda function"
  default     = 30
}

variable "function_role" {
  type        = string
  description = "IAM Role name that this function will assume. Should provide the AWSLambdaBasicExecutionRole policy. If not specified, an appropriate Role will be created."
  default     = null
}

variable "permissions_boundary" {
  type        = string
  description = "IAM Role Permissions Boundary (optional)"
  default     = null
}

variable "lambda_log_retention_in_days" {
  type        = number
  description = "Number of days to keep logs from the lambda for"
  default     = 7
}

variable "python_runtime_version" {
  type        = string
  description = "The lambda Python runtime version"
  default     = "3.9"
}

variable "tags" {
  type        = map(string)
  description = "Tags to add to the resources created"
  default     = {}
}
