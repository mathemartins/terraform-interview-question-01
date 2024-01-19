variable "vpc-cloud-id" {
  description = "The VPC ID for the vpc cloud network"
  type        = string
}


variable "tags" {
  description = "The Tags for the vpc cloud network"
  type        = map(string)
}


variable "internet-gateway-id" {
  description = "The internet gateway id to be used for the route table"
  type        = string
}



variable "nat-gateway-id" {
  description = "The nat gateway id to be used for the route table"
  type        = string
}


variable "public-subnet-id" {
  description = "Public Subnet ID"
  type        = string
}



variable "private-subnet-id" {
  description = "Private Subnet ID"
  type        = string
}