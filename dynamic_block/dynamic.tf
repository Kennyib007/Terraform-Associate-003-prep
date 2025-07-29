provider "aws" {
  region = "us-east-1"
}


variable "sg_ports" {
  type        = list(number)
  description = "list of ports for ingress"
  default     = [9200, 9300, 9400, 9500]

}

resource "aws_security_group" "sg_dynamic" {
  name        = "sg_dynamic"
  description = "ingress for web server"

  dynamic "ingress" {
    for_each = var.sg_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
 
  }

  dynamic "egress" {
    for_each = var.sg_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }
}