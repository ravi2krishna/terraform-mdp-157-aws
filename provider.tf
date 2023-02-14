# Variables for security
variable "aws_access_key" {}
variable "aws_secret_key" {}

# AWS Provider Details
provider "aws" {
  region     = "ca-central-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

