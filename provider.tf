data "aws_caller_identity" "default" {}

terraform {
  cloud {
    organization = "ethanbayliss"
    workspaces {
      name = "infra-aws-budgets"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.84.0"
    }
  }
}

provider "aws" {
  region     = var.AWS_DEFAULT_REGION
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY

  default_tags {
    tags = {
      env          = var.env
      repo         = var.repo
      tf_workspace = terraform.workspace
      managed_by   = var.managed_by
    }
  }
}
