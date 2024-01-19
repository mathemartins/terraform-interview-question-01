# VPC - Virtual Private Cloud

resource "aws_vpc" "vpc-network" {
  cidr_block = "10.0.0.0/16"
  tags       = var.tags
}


# @TODO: the security group to be done later