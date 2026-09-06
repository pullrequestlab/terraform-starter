variable "project_name" {
  description = "Name prefix for security resources."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where security groups are created."
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR used for internal egress rules."
  type        = string
}

variable "alb_ingress_cidrs" {
  description = "CIDR blocks allowed to access the load balancer."
  type        = list(string)
}

variable "application_port" {
  description = "Application container port."
  type        = number
}

variable "database_port" {
  description = "Database listener port."
  type        = number
}
