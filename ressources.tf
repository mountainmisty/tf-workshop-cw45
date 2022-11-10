resource "aws_instance" "app_server" {
  count         = var.node_count
  ami           = lookup(var.image_id, var.region)
  instance_type = var.app_server_instance_type

  user_data = file("install_webserver.sh")

  tags = merge({
    Name = "Webserver ${count.index + 1}"
    }, var.common_tags
  )
}

resource "aws_instance" "db_server" {
  count         = var.db_server_build ? 1 : 0
  ami           = lookup(var.image_id, var.region)
  instance_type = "t2.micro"
}
