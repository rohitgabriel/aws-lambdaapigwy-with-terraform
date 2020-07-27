# ----------------------------------------------------------------------
# Default AWS Region used to deploy resources
# ----------------------------------------------------------------------
variable "aws_region" {
  default     = "ap-southeast-2"
  description = "set AWS region"
}

# ----------------------------------------------------------------------
# Application name used for naming resources
# ----------------------------------------------------------------------
variable "app_name" {
  default     = "employees-api"
  description = "Application name used for naming resources"
}

# ----------------------------------------------------------------------
# API stage name 
# ----------------------------------------------------------------------
variable "stage_name" {
  default     = "development"
  description = "API stage name"
}

variable "stage_canary" {
  default     = "canary"
  description = "API stage name"
}
# ----------------------------------------------------------------------
# Lambda functions, used to retrieve function ARN CFN exports
# ----------------------------------------------------------------------
variable "api_lambda_functions" {
  default = [
    "get-data",
    "put-data"
  ]
  description = "Lambda functions, used to retrieve function ARN CFN exports"
}

# ----------------------------------------------------------------------
# Lambda invoke URI prefix used in openAPI specification
# ----------------------------------------------------------------------
variable "lambda_invoke_uri_prefix" {
  default     = "arn:aws:apigateway:ap-southeast-2:lambda:path/2015-03-31/functions"
  description = "Lambda invoke URI prefix used in openAPI specification"
}

# ----------------------------------------------------------------------
# S3 bucket for converted SAM templates
# ----------------------------------------------------------------------
variable "sam_code_bucket" {
  default     = "aws-sam-code-eiti"
  description = "Pre-existing S3 bucket for converted SAM templates"
}
