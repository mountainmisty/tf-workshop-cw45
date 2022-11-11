terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.38"
    }
  }
  required_version = ">= 1.0"
  backend "s3" {
    bucket         = "mro-terraform-state"
    key            = "terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "mro-terraform-state-lock"
  }
}
