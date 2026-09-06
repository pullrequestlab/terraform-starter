variable "project_name" {
  description = "Short name used to prefix resource names."
  type        = string
  default     = "review-lab"

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{2,17}$", var.project_name))
    error_message = "project_name must be 3-18 lowercase letters, numbers, or hyphens, starting with a letter."
  }
}

variable "environment" {
  description = "Deployment environment name."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "stage", "prod"], var.environment)
    error_message = "environment must be one of: dev, stage, prod."
  }
}

variable "aws_region" {
  description = "AWS region for this fake example stack."
  type        = string
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "CIDR block for the application VPC."
  type        = string
  default     = "10.42.0.0/16"

  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "vpc_cidr must be a valid IPv4 CIDR block."
  }
}

variable "az_count" {
  description = "Number of availability zones to use."
  type        = number
  default     = 2

  validation {
    condition     = var.az_count >= 2 && var.az_count <= 3
    error_message = "az_count must be 2 or 3."
  }
}

variable "alb_ingress_cidrs" {
  description = "CIDR blocks allowed to reach the public load balancer."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "container_image" {
  description = "Container image used by the fake API service."
  type        = string
  default     = "public.ecr.aws/docker/library/nginx:1.27"
}

variable "service_desired_count" {
  description = "Desired number of ECS tasks."
  type        = number
  default     = 2
}

variable "autoscaling_min_capacity" {
  description = "Minimum ECS task count for application autoscaling."
  type        = number
  default     = 1
}

variable "autoscaling_max_capacity" {
  description = "Maximum ECS task count for application autoscaling."
  type        = number
  default     = 2
}

variable "autoscaling_target_cpu" {
  description = "Average CPU utilization target for ECS autoscaling."
  type        = number
  default     = 85
}

variable "db_name" {
  description = "Initial database name."
  type        = string
  default     = "reviewlab"
}

variable "db_username" {
  description = "Database admin username for the starter example."
  type        = string
  default     = "review_admin"
}

variable "db_password" {
  description = "Fake database password for example plans. Do not commit real secrets."
  type        = string
  sensitive   = true

  validation {
    condition     = length(var.db_password) >= 16
    error_message = "db_password must be at least 16 characters."
  }
}

variable "alert_email" {
  description = "Optional email address subscribed to infrastructure alerts."
  type        = string
  default     = null
}

variable "tags" {
  description = "Additional tags merged into all provider-managed resources."
  type        = map(string)
  default     = {}
}
