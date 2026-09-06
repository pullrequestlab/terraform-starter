variable "project_name" {
  description = "Name prefix for compute resources."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for load balancer and target group resources."
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for the load balancer."
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for ECS tasks."
  type        = list(string)
}

variable "load_balancer_sg_id" {
  description = "Security group ID attached to the load balancer."
  type        = string
}

variable "service_sg_id" {
  description = "Security group ID attached to ECS tasks."
  type        = string
}

variable "container_image" {
  description = "Container image for the fake API service."
  type        = string
}

variable "desired_count" {
  description = "Desired ECS task count."
  type        = number
}

variable "access_logs_bucket" {
  description = "Optional S3 bucket name for ALB access logs."
  type        = string
  default     = null
}

variable "database_endpoint" {
  description = "Database host exposed to the application container."
  type        = string
}

variable "database_secret_arn" {
  description = "Secrets Manager ARN exposed to the application container."
  type        = string
}

variable "container_port" {
  description = "Port exposed by the application container."
  type        = number
  default     = 80
}

variable "cpu" {
  description = "Fargate task CPU units."
  type        = number
  default     = 256
}

variable "memory" {
  description = "Fargate task memory in MiB."
  type        = number
  default     = 512
}
