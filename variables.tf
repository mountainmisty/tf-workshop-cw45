variable "region" {
  type = string
  default = "eu-west-1"
}

variable "app_server_instance_type" {
  type        = string
  description = "The aws instance-type"
  default     = "t2.micro"
}

variable "image_id" {
  type        = map(string)
  description = "The id of the machine image (AMI) to use for the server."
  default     = {
   "eu-central-1" = "ami-0f61af304b14f15fb"
   "eu-west-1" = "ami-0ee415e1b8b71305f"
  }
}

variable "node_count" {
  type        = number
  description = "The number of servers to create"
  default     = 3
}
