# Terraform block
terraform {
  backend "s3" {
    key     = "dev/resume-ci-cd/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.11.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}