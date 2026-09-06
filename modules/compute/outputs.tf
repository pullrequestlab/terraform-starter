output "application_url" {
  description = "HTTP URL for the application load balancer."
  value       = "http://${aws_lb.app.dns_name}"
}

output "cluster_name" {
  description = "ECS cluster name."
  value       = aws_ecs_cluster.this.name
}

output "service_name" {
  description = "ECS service name."
  value       = aws_ecs_service.app.name
}

output "load_balancer_arn_suffix" {
  description = "Load balancer ARN suffix for CloudWatch metrics."
  value       = aws_lb.app.arn_suffix
}

output "target_group_arn_suffix" {
  description = "Target group ARN suffix for CloudWatch metrics."
  value       = aws_lb_target_group.app.arn_suffix
}
