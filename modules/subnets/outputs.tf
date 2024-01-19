output "private-subnet-ids" {
  value = values(aws_subnet.private-subnet)[*].id
}

output "public-subnet-ids" {
  value = values(aws_subnet.public-subnet)[*].id
}

output "public-subnets" {
  value = values(aws_subnet.public-subnet)[*]
}

output "private-subnets" {
  value = values(aws_subnet.private-subnet)[*]
}