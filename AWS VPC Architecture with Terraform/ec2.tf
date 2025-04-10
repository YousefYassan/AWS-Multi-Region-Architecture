
# resource "aws_network_interface" "foo" {
#   subnet_id   = aws_subnet.public1.id
#   private_ips = ["10.0.1.5"]
#   security_groups = [aws_security_group.allow_tls.id]
#   tags = {
#     Name = "primary_network_interface"
#   }
# }

resource "aws_instance" "instancetf" {
  ami             = "ami-016038ae9cc8d9f51" # us-west-2
  instance_type   = "t3.micro"
  subnet_id       = module.network.public1_subnet_id  #------------use moduel
  key_name        = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.allow_tls.id]
  count = var.count
  #associate_public_ip_address =true


  # network_interface {
  #   network_interface_id = aws_network_interface.foo.id
  #   device_index         = 0
  # }

  # credit_specification {
  #   cpu_credits = "unlimited"
  # }
  tags = {
    Name = "tfint"
   # Name=var.ec2_names[count.index]  iff i wanan create more than one instance in list ----by count and varible&tfvars
  }
}



