locals {
  name_prefix = "${var.project_name}-${var.environment}"

  common_tags = merge(
    {
      Project     = var.project_name
      Environment = var.environment
      Owner       = var.owner_email
      CostCenter  = var.cost_center
      ManagedBy   = "terraform"
      Starter     = "terraform-starter"
    },
    var.tags
  )
}
