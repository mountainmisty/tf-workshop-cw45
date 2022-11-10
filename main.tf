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
