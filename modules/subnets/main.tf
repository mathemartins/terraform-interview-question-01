# modules/subnets/main.tf

data "aws_region" "current" {}
data "aws_availability_zones" "az" {}

# Public subnet resource to be created 3 times in all available zones
resource "aws_subnet" "public-subnet" {
  for_each                = var.public_subnets
  vpc_id                  = var.vpc-network-id
  cidr_block              = cidrsubnet(var.vpc-cidr, 8, each.value)
  availability_zone       = tolist(data.aws_availability_zones.az.names)[each.value]
  map_public_ip_on_launch = true
  tags = merge(var.tags, {
    "Name"      = each.key
    "Terraform" = true
  })
}

# Private subnet resource to be created 3 times in all available zones
resource "aws_subnet" "private-subnet" {
  for_each          = var.private_subnets
  vpc_id            = var.vpc-network-id
  cidr_block        = cidrsubnet(var.vpc-cidr, 8, each.value + 100)
  availability_zone = tolist(data.aws_availability_zones.az.names)[each.value]
  tags = merge(var.tags, {
    "Name"      = each.key
    "Terraform" = true
  })
}


