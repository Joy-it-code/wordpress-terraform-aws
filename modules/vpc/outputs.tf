output "vpc_id" {
  description = "VPC ID"
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "The public subnet IDs"
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "The public subnet IDs"
  value = aws_subnet.private[*].id
}