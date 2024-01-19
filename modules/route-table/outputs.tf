output "public-route-table-id" {
  value = aws_route_table.public-route-table.id
}


output "private-route-table-id" {
  value = aws_route_table.private-route-table.id
}