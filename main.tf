terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.38"
    }
  }
  required_version = ">= 1.0"
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0f61af304b14f15fb"
  instance_type = "t2.small"

  tags = {
    Name = "Example"
  }
}
