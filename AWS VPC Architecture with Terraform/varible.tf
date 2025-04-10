variable region{
    type=string
}
variable vpc_cidr {
  type=string
  default = "10.0.0.0/16"
}
variable count {
  type=int
  default = 1
}
variable ec2_names {
  type = list
}