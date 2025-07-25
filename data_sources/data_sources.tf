provider "aws" {
  region = "us-east-1"
}

data "aws_instance" "inventory" {
  filter {
    name   = "tag:Team"
    values = ["Production"]
  }
}

data "aws_ami" "ubuntu_image" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu-pro-server/images/hvm-ssd/ubuntu-jammy-22.04-amd64-pro-server-*"]
  }

}

resource "aws_instance" "staging_01" {
  ami           = data.aws_ami.ubuntu_image.image_id
  instance_type = "t2.micro"

}

