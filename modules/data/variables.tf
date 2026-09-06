variable "project_name" {
  description = "Name prefix for data resources."
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs where the database can run."
  type        = list(string)
}

variable "database_sg_id" {
  description = "Database security group ID."
  type        = string
}

variable "db_name" {
  description = "Initial database name."
  type        = string
}

variable "db_username" {
  description = "Database admin username."
  type        = string
}

variable "db_password" {
  description = "Database admin password."
  type        = string
  sensitive   = true
}

variable "instance_class" {
  description = "RDS instance class."
  type        = string
  default     = "db.t4g.micro"
}

variable "allocated_storage" {
  description = "Allocated database storage in GB."
  type        = number
  default     = 20
}
