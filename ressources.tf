resource "aws_instance" "app_server" {
  count = 4
  ami           = "ami-0f61af304b14f15fb"
  instance_type = "t3.micro"

  tags = {
    Name       = "Server Example ${count.index+1}"
    costcenter = "42"
  }
}
