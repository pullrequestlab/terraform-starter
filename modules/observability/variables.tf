variable "project_name" {
  description = "Name prefix for observability resources."
  type        = string
}

variable "alert_email" {
  description = "Optional email address for alarm notifications."
  type        = string
  default     = null
}

variable "load_balancer_arn_suffix" {
  description = "Load balancer ARN suffix used in CloudWatch metrics."
  type        = string
}

variable "target_group_arn_suffix" {
  description = "Target group ARN suffix used in CloudWatch metrics."
  type        = string
}

variable "cluster_name" {
  description = "ECS cluster name shown in the dashboard."
  type        = string
}

variable "service_name" {
  description = "ECS service name shown in the dashboard."
  type        = string
}
