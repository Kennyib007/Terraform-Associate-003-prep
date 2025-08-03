
resource "aws_instance" "bravo" {
  ami           = data.aws_ami.ubuntu_image.id
  instance_type = local.instance_type[terraform.workspace]

}

data "aws_ami" "ubuntu_image" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu-pro-server/images/hvm-ssd/ubuntu-jammy-22.04-amd64-pro-server-*"]
  }

}