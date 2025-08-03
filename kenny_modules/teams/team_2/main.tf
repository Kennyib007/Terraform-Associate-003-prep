
provider "aws" {
    region = "us-east-1"
}

provider "aws" {
    alias = "ohio"
    region = "us-east-2"
  
}

module "sg-01" {
    source = "../../modules/network"
    providers = {
      aws.dev = aws.ohio
    }
  
}