resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = "true"
  tags = {
    Name = "iti3m_vpc"
  }

#-----------provisioner
  #  provisioner "local-exec" {
  #    command = "echo ${self.arn}"
  #  }

}
 

# resource "aws_subnet" "main" {
#   vpc_arn = aws_vpc.main.arn
#   cidr_block = "10.0.0.0/16"
#   enable_dns_hostnames="true"
# }




#------------null
# resource "null_resource" "run_command" {
#    provisioner "local-exec" {
#      command = "echo ${self.arn}"
#    }

# }



#-----------null-infinte
#terraform taint {null_resource.run_command}----->name of null_resource