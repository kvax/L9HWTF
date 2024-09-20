# VPC Output

output "private_subnets" {
  description = "The created private subnets"
  value       = aws_subnet.private[*].id
}

output "public_subnets" {
  description = "The created public subnets"
  value       = aws_subnet.public[*].id
}

output "vpc_id" {
  description = "The created VPC ID"
  value       = aws_vpc.main.id
}