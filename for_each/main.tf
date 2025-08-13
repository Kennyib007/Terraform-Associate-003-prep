provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "backup" {
  for_each      = var.instance_config
  ami           = each.value.ami
  instance_type = each.value.instance_type

}