
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.5"
    }
  }
}

resource "aws_instance" "machine" {
    ami = var.ami
    instance_type = var.instance_type

}

