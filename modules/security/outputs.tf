output "load_balancer_sg_id" {
  description = "Security group ID for the application load balancer."
  value       = aws_security_group.load_balancer.id
}

output "service_sg_id" {
  description = "Security group ID for the ECS service."
  value       = aws_security_group.service.id
}

output "database_sg_id" {
  description = "Security group ID for the RDS database."
  value       = aws_security_group.database.id
}
