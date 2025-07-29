provider "aws" {
    region = "us-east-1" 
}

resource "aws_iam_user" "contractors" {
    name = "contractor.${count.index}"
    count = 3
    path = "/system/"
}

output "iam_names" {
    value = aws_iam_user.contractors[*].name

}

output "iam_arn" {
    value = aws_iam_user.contractors[*].arn
  
}