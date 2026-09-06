# Terraform Architecture Starter

This is a small Terraform project that models a fake AWS product architecture for pull request and infrastructure review examples.

The stack is intentionally compact, but it includes enough real Terraform structure for useful beginner and intermediate review challenges:

- provider, variable, output, and local value organization
- reusable modules for network, security, compute, data, and observability
- a public application load balancer in front of private ECS tasks
- a private PostgreSQL database with a Secrets Manager entry
- CloudWatch dashboard and alarm wiring

This starter is for examples. It is not production-hardened and may create billable AWS resources if applied.

## Architecture

```text
Internet
  |
  v
Application Load Balancer (public subnets)
  |
  v
ECS Fargate service (private subnets)
  |
  v
PostgreSQL RDS instance (private subnets)

CloudWatch dashboard + alarm -> SNS topic
```

## Scripts

```sh
terraform fmt -recursive
terraform init
terraform validate
terraform plan -var-file=terraform.tfvars.example
```

## Example challenge branches

- Add a second ECS service behind path-based routing.
- Move shared tags into a separate reusable module.
- Make NAT gateways highly available across availability zones.
- Add VPC endpoints for ECR, CloudWatch Logs, and Secrets Manager.
- Replace the database password variable with generated credentials.
- Add stricter validation for CIDR ranges and sizing inputs.
- Add remote state configuration for an S3 backend.
