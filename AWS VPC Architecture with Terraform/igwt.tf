resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  #   subnet_id       = aws_subnet.public1.id
  #   private_ips     = ["10.0.0.50"]
  #   security_groups = [aws_security_group.web.id]

  #   attachment {
  #     instance     = aws_instance.foo.id
  #     device_index = 1
  #   }
  tags = {
    Name = "igwTF"
  }
}