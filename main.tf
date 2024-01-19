

module "vpc-network" {
  source = "./modules/vpc"
  tags = {
    "Name"      = "vpc-network"
    "Terraform" = true
  }
}

module "subnets" {
  source = "./modules/subnets"

  vpc-cidr       = module.vpc-network.vpc-cidr
  vpc-network-id = module.vpc-network.vpc-network-id
  tags = {
    "Name"      = "subnet"
    "Terraform" = true
  }

  public_subnets = {
    "public_subnet_1" = 1
    "public_subnet_2" = 2
    "public_subnet_3" = 3
  }

  private_subnets = {
    "private_subnet_1" = 1
    "private_subnet_2" = 2
    "private_subnet_3" = 3
  }

}


module "internet-gateway" {
  source = "./modules/ig"
  vpc-id = module.vpc-network.vpc-network-id

  tags = {
    "Name"      = "internet-gateway"
    "Terraform" = true
  }
}


module "elastic-ip" {
  source     = "./modules/eip"
  depends_on = [module.internet-gateway]

  tags = {
    "Name"      = "eip for nat"
    "Terraform" = true
  }

}



module "nat-gateway" {
  source        = "./modules/nat-gateway"
  depends_on    = [module.subnets.public-subnets]
  allocation-id = module.elastic-ip.eip_nat_gateway_id
  subnet-id     = element(module.subnets.public-subnet-ids, 0) # Select the first subnet ID
  #  subnet-id     = module.subnets.public-subnets["public_subnet_1"].id
  tags = {
    "Name"      = "nat-gateway"
    "Terraform" = true
  }
}



module "route-table" {
  source              = "./modules/route-table"
  vpc-cloud-id        = module.vpc-network.vpc-network-id
  internet-gateway-id = module.internet-gateway.ig-resource-id
  nat-gateway-id      = module.nat-gateway.nat-gateway-id
  public-subnet-id    = element(module.subnets.public-subnet-ids, 0)
  private-subnet-id   = element(module.subnets.public-subnet-ids, 0)
  tags = {
    "Name"      = "route-gateway"
    "Terraform" = true
  }
}

