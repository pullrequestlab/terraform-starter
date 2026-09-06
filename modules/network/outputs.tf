output "vpc_id" {
  description = "Generated VPC ID."
  value       = aws_vpc.this.id
}

output "vpc_cidr" {
  description = "CIDR block assigned to the generated VPC."
  value       = aws_vpc.this.cidr_block
}

output "public_subnet_ids" {
  description = "Public subnet IDs for internet-facing resources."
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "Private subnet IDs for application and data resources."
  value       = aws_subnet.private[*].id
}
