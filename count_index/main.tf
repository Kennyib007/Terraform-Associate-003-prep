resource "aws_instance" "machine01" {
    ami = "ami-00c39f71452c08778"   
    instance_type = "t2.micro"
    count = 3

    tags = {
      Name = "application-layer-${count.index}"
    }
}

variable "users" {
  type = list
  default = ["kenny", "ramat", "cindy","charles","bolu"]
}


resource "aws_iam_user" "employees" {
  name = var.users[count.index]
  count = 3
}

# hardcoding simply for practice context absolutely should not !!!!
# charles and bolu will be ignored cause they exceed count number specified