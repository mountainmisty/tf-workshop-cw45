resource "aws_instance" "app_server" {
  count           = var.node_count
  ami             = lookup(var.image_id, var.region)
  instance_type   = var.app_server_instance_type
  security_groups = [aws_security_group.web-access.name]
  user_data       = file("install_webserver.sh")

  tags = merge({
    Name = "Webserver ${count.index + 1}"
    }, var.common_tags
  )
}

resource "aws_security_group" "web-access" {
  name        = "web-access"
  description = "Allow port 80 access from outside world"

  dynamic "ingress" {
    for_each = var.ingress-ports
    content {
      description = "This Rule Number ${ingress.key + 1}, we open Port ${ingress.value} to the world"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "db_server" {
  count         = var.db_server_build ? 1 : 0
  ami           = lookup(var.image_id, var.region)
  instance_type = "t2.micro"
}
