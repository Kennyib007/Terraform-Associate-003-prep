
terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
        configuration_aliases = [ aws.dev ]
    }
  }
}

resource "aws_security_group" "test" {
    name = "test_sg"
}

resource "aws_security_group" "dev" {
    name = "dev_sg" 
    provider = aws.dev
}