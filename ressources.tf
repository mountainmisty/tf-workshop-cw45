resource "aws_instance" "app_server" {
  count         = length(var.server_names)
  ami           = lookup(var.image_id, var.region)
  instance_type = var.app_server_instance_type

  tags = {
    Name       = var.server_names[count.index]
    costcenter = "42"
  }
}

resource "aws_instance" "db_server" {
  count         = var.db_server_build ? 1 : 0
  ami           = lookup(var.image_id, var.region)
  instance_type = "t2.micro"
}
