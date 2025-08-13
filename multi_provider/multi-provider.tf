provider "aws" {
    region = "us-east-1"
}

provider "aws" {
    alias  = "westos"
    region = "us-west-1"
}

provider "aws" {
    alias  = "africa"
    region = "af-south-1"
}

resource "aws_security_group" "kenzo_sg" {
  name        = "dev_firewall"
  provider    = aws.westos
}

resource "aws_security_group" "taiwo_sg" {
  name        = "prod_firewall"
  provider    = aws.africa 
}