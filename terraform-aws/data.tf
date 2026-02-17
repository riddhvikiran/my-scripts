data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "subnet_a" {
  availability_zone = "eu-north-1a"
  default_for_az    = true
}

data "aws_subnet" "subnet_b" {
  availability_zone = "eu-north-1b"
  default_for_az    = true
}

