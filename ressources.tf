resource "aws_instance" "app_server" {
  count         = var.node_count
  ami           = lookup(var.image_id, var.region)
  instance_type = var.app_server_instance_type

  tags = {
    Name       = "Server Example ${count.index + 1}"
    costcenter = "42"
  }
}
