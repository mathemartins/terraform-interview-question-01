output "vpc-network-id" {
  value = aws_vpc.vpc-network.id
}

output "vpc-cidr" {
  value = aws_vpc.vpc-network.cidr_block
}