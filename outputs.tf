output "application_url" {
  description = "Public URL for the fake application load balancer."
  value       = module.compute.application_url
}

output "vpc_id" {
  description = "ID of the generated VPC."
  value       = module.network.vpc_id
}

output "private_subnet_ids" {
  description = "Private subnet IDs used by the app and database tiers."
  value       = module.network.private_subnet_ids
}

output "database_secret_arn" {
  description = "Secrets Manager ARN containing database connection metadata."
  value       = module.data.database_secret_arn
}

output "dashboard_name" {
  description = "CloudWatch dashboard name for the starter stack."
  value       = module.observability.dashboard_name
}
