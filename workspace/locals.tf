locals {
  instance_type = {
    default = "t2.nano"
    dev     = "t2.micro"
    prod    = "t3.micro"
  }
}