provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-051d703a3bf4eb335" # Amazon Linux 2 (us-east-1)
  instance_type = "c7i-flex.large"

  tags = {
    Name = "TEST"
  }
}
