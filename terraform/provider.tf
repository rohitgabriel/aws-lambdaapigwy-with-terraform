# ----------------------------------------------------------------------
# AWS Provider
# ----------------------------------------------------------------------
provider "aws" {
  region = var.aws_region
}

# ----------------------------------------------------------------------
# Terraform S3 backend with DynamoDB Lock table
# ----------------------------------------------------------------------
terraform {
  backend "s3" {
    bucket         = "employees-api-tfstate"
    key            = "employees-api.tfstate"
    dynamodb_table = "terraform-lock"
    region         = "ap-southeast-2"
    encrypt        = "true"
  }
}
