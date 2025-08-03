

provider "aws" {
    region = "us-east-1"
}

module "ec2" {
    source = "../../modules/ec2"
    instance_type = "t2.micro"
    ami = ""
}

resource "aws_eip" "lb" {
  instance = module.ec2.instance_id
  domain = "vpc"
}


# read documentation on module sources to verify format for calling mmodules from variety of sources