resource "aws_security_group" "load_balancer" {
  name        = "${var.project_name}-alb-sg"
  description = "Allow public HTTP traffic to the starter load balancer."
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP from configured CIDR blocks"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.alb_ingress_cidrs
  }

  egress {
    description = "Forward traffic to private application tasks"
    from_port   = var.application_port
    to_port     = var.application_port
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  tags = {
    Name = "${var.project_name}-alb-sg"
  }
}

resource "aws_security_group" "service" {
  name        = "${var.project_name}-service-sg"
  description = "Allow traffic from the load balancer to private ECS tasks."
  vpc_id      = var.vpc_id

  ingress {
    description     = "Application traffic from load balancer"
    from_port       = var.application_port
    to_port         = var.application_port
    protocol        = "tcp"
    security_groups = [aws_security_group.load_balancer.id]
  }

  egress {
    description = "Allow outbound traffic for package, log, and data access"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-service-sg"
  }
}

resource "aws_security_group" "database" {
  name        = "${var.project_name}-db-sg"
  description = "Allow database traffic only from the ECS service."
  vpc_id      = var.vpc_id

  ingress {
    description     = "PostgreSQL from private service tasks"
    from_port       = var.database_port
    to_port         = var.database_port
    protocol        = "tcp"
    security_groups = [aws_security_group.service.id]
  }

  egress {
    description = "Allow database maintenance egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-db-sg"
  }
}
