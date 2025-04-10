
resource "aws_route_table" "pupbicRT" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "pupbicRT"
  }
}

resource "aws_route_table_association" "pupblicRTassc1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.pupbicRT.id

}
resource "aws_route_table_association" "pupblicRTassc2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.pupbicRT.id

}



resource "aws_route_table" "privateRT" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id

  }
  tags = {
    Name = "privateRT"
  }
}


resource "aws_route_table_association" "privateRTassc1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.privateRT.id

}
resource "aws_route_table_association" "privateRTassc2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.privateRT.id

}

# resource "aws_subnet" "main" {
#   cidr_block = "10.0.1.0/24"
#   vpc_id     = aws_vpc.main.id
# }

# resource "aws_network_interface" "main" {
#   subnet_id = aws_subnet.main.id
# }








# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"
# }

# resource "aws_route_table" "main" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block           = aws_vpc.main.cidr_block
#     network_interface_id = aws_network_interface.main.id
#   }
# }

# resource "aws_subnet" "main" {
#   cidr_block = "10.0.3.0/24"
#   vpc_id     = aws_vpc.main.id
# }

# resource "aws_network_interface" "main" {
#   subnet_id = aws_subnet.main.id
# }