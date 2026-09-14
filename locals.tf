locals {
  name_prefix = "${var.project_name}-${var.environment}"

  database_profile = var.database_profiles[var.environment]

  common_tags = merge(
    {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "terraform"
      Starter     = "terraform-starter"
    },
    var.tags
  )
}
