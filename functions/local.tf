# variable "tags" {
#   type = map
#   default = {
#     Team = "infra-team"
#   }
# }

locals {
  default = {
    Team         = "infra-teams"
    CreationDate = "date-${formatdate("DDMMYYYY", timestamp())}"
  }
}

resource "aws_security_group" "sg_infra" {
  name = "infra_firewall"
  tags = local.default
}

resource "aws_security_group" "sg_build" {
  name = "build_firewall"
  tags = local.default
}