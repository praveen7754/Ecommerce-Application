terraform {
  required_version = ">= 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket  = "praveen-ecommerce-terraform-state-743320495203"
    key     = "ecommerce/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
