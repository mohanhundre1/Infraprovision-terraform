
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.75.0"  # Use an appropriate version for your use case
    }
  }
}

provider "aws" {
  region = var.aws_region
}