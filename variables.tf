variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "app_server_instance_type" {
  type        = string
  description = "The aws instance-type"
  default     = "t2.micro"
}

variable "image_id" {
  type        = map(string)
  description = "The id of the machine image (AMI) to use for the server."
  default = {
    "eu-central-1" = "ami-0f61af304b14f15fb"
    "eu-west-1"    = "ami-0ee415e1b8b71305f"
  }
}

variable "node_count" {
  type        = number
  description = "The number of servers to create"
  default     = 3
}

variable "server_names" {
  type    = list(string)
  default = ["Mailserver", "Webserver", "Firewall", "SSH-Jumpbox"]
}

variable "db_server_build" {
  type    = bool
  default = false
}

variable "common_tags" {
  type = map(string)
  default = {
    Department  = "Global Infrastructure Services"
    Team        = "EMEA Delivery"
    CostCenter  = "12345"
    Application = "Intranet-Portal"
  }
}

variable "ingress-rules" {
  type = map(any)
  default = {
    "Rule Number 1" = {
      port        = 80,
      cidr_blocks = ["0.0.0.0/0"],
      protocol    = "tcp"
    },
    "Rule Number 2" = {
      port        = 22,
      cidr_blocks = ["10.0.0.0/16"],
      protocol    = "tcp"
    },
    "Rule Number 3" = {
      port        = 443,
      cidr_blocks = ["0.0.0.0/0"],
      protocol    = "tcp"
    }
  }
}


variable "hosting-bucket" {
  default = "zh-mro-website"
}
