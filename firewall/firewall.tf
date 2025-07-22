provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "kennytf_sg" {
  name        = "kenntf-sg"
  description = "kennytf-sg Managed by terraform"
}

resource "aws_vpc_security_group_ingress_rule" "allow_port80" {
  security_group_id = aws_security_group.kennytf_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_port443" {
  security_group_id = aws_security_group.kennytf_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_sshelbip" {
  security_group_id = aws_security_group.kennytf_sg.id
  cidr_ipv4         = "${aws_eip.k2.public_ip}/32"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.kennytf_sg.id 
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # equivalent to all ports
}

# to create elastic ip 
resource "aws_eip" "k2" {
# instance = instance.id ( to associate eip with instance)
  domain   = "vpc"
} 