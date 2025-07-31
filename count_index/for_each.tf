variable "owner" {
    type = set(string)
    default = ["kenny","taiwo","samad","adam"]
}

resource "aws_iam_user" "profile" {
    for_each = var.owner
    name = each.value
}

variable "map-01" {
    default = {
        dev = "value"
        prod = "value1"
    }
}

resource "aws_instance" "web" {
  for_each      = var.map-01
  ami           = each.value
  instance_type = "t3.micro"

  tags = {
    Name = each.key
  }
}