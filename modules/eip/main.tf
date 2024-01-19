resource "aws_eip" "eip_nat_gateway" {
  vpc  = true
  tags = var.tags
}