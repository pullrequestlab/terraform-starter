variable "project_name" {
  description = "Name prefix for bastion resources."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the bastion security group is created."
  type        = string
}

variable "subnet_id" {
  description = "Public subnet ID where the bastion instance is placed."
  type        = string
}

variable "allowed_ssh_cidrs" {
  description = "CIDR blocks allowed to reach SSH."
  type        = list(string)
}

variable "instance_type" {
  description = "Bastion EC2 instance type."
  type        = string
}

variable "public_key" {
  description = "Public key material for the bastion key pair."
  type        = string
}
