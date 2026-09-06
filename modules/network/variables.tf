variable "project_name" {
  description = "Name prefix for network resources."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "az_count" {
  description = "Number of availability zones to use."
  type        = number
}

variable "enable_vpc_endpoints" {
  description = "Whether to create VPC endpoints for private service access."
  type        = bool
  default     = true
}
