output "database_endpoint" {
  description = "RDS database endpoint."
  value       = aws_db_instance.this.address
}

output "database_secret_arn" {
  description = "Secrets Manager ARN containing database connection metadata."
  value       = aws_secretsmanager_secret.database.arn
}
