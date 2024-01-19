resource "aws_route_table" "public-route-table" {
  vpc_id = var.vpc-cloud-id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet-gateway-id
  }
  tags = var.tags
}

resource "aws_route_table" "private-route-table" {
  vpc_id = var.vpc-cloud-id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat-gateway-id
  }

  tags = var.tags
}

resource "aws_route_table_association" "public_association" {
  subnet_id      = var.public-subnet-id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "private_association" {
  subnet_id      = var.private-subnet-id
  route_table_id = aws_route_table.private-route-table.id
}