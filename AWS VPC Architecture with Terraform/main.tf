module "network" {
    source = "./network"
    cidr=var.vpc_cidr
    region=var.region
  
} 