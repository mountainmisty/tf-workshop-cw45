resource "aws_instance" "app_server" {
  ami           = "ami-0f61af304b14f15fb"
  instance_type = "t3.micro"

  tags = {
    Name       = "Example"
    costcenter = "42"
  }
}
