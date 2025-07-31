resource "aws_instance" "likko_a" {
  ami           = "ami-0e449927258d45bc4"    
  instance_type = "t2.micro"
  depends_on = [aws_s3_bucket.example]
}

resource "aws_s3_bucket" "likko_s" {
  bucket = "likko-storage1"
}


# hardcoding simply for sample context, avoid same !