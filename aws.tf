terraform {
  required_version = "~> 1.0.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.68.0"
    }
  }
}

provider "aws" {
  region                  = var.region
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
}

data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
data "aws_availability_zones" "az" {
  state = "available"
}
