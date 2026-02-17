resource "aws_instance" "my_ec2" {
  count         = 3
  ami           = "ami-051d703a3bf4eb335"
  instance_type = "c7i-flex.large"

  subnet_id = element(
    [
      data.aws_subnet.subnet_a.id,
      data.aws_subnet.subnet_b.id
    ],
    count.index % 2
  )

  root_block_device {
    volume_size = count.index == 1 ? 20 : 5
    volume_type = "gp3"
  }

  tags = {
    Name = "my-ec2-${count.index + 1}"
  }
}

