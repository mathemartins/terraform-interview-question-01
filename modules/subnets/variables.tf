variable "private_subnets" {
  description = "The private subnets"
  type        = map(any)
  default = {
    "private_subnet_1" = 1
    "private_subnet_2" = 2
    "private_subnet_3" = 3
  }
}

variable "public_subnets" {
  description = "The private subnets"
  type        = map(any)
  default = {
    "public_subnet_1" = 1
    "public_subnet_2" = 2
    "public_subnet_3" = 3
  }
}

variable "vpc-network-id" {
  description = "The VPC ID from vpc resource output"
  type        = string
}

variable "vpc-cidr" {
  description = "The VPC CIDR from vpc resource output"
  type        = string
}

variable "tags" {
  description = "The general tags for subnet resource "
  type        = map(string)
}
