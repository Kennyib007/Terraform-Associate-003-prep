provider "aws" {
  region = var.region
}

variable "region" {
  default = "us-east-1"
}

resource "aws_iam_user" "kenxo" {
  name = "kenxo_user"
}

resource "aws_iam_user_policy" "kenxo_RBAC" {
  name = "kenxo_user"
  user = aws_iam_user.kenxo.name

  policy = file("./kenxo-user.json")
}


variable "tags" {
  type    = list(any)
  default = ["machineaa", "machineab", "machineac"]
}

variable "ami" {
  type = map(any)
  default = {
    "us-east-1"  = "ami-08a0d1e16fc3f61ea"
    "us-west-2"  = "ami-0b20a6f09484773af"
    "ap-south-1" = "ami-0e1d06225679bc1c5"
  }
}


resource "aws_instance" "web-test" {
  ami           = lookup(var.ami, var.region)
  instance_type = "t2.micro"
  count         = length(var.tags)

  tags = {
    Name         = element(var.tags, count.index)
    CreationDate = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  }
}



# Other functions can be added.