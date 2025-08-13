provider "aws" {
  region = "us-east-1"
}

data "aws_iam_users" "users" {
  
}

data "aws_caller_identity" "whogoes" {
  
}

resource "aws_iam_user" "agent" {
  name = "admin-agent-${data.aws_caller_identity.whogoes.account_id}"
  path = "/system/"
}

output "user_nunmber" {
  value = length(data.aws_iam_users.users.names)
}

