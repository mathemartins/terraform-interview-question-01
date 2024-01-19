resource "aws_nat_gateway" "nat-gateway" {
  subnet_id     = var.subnet-id
  allocation_id = var.allocation-id
  tags          = var.tags
}