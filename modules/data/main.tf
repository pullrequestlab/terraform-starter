resource "aws_db_subnet_group" "this" {
  name       = "${var.project_name}-db-subnets"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.project_name}-db-subnets"
  }
}

resource "aws_db_instance" "this" {
  identifier              = "${var.project_name}-postgres"
  engine                  = "postgres"
  engine_version          = "16.3"
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = [var.database_sg_id]
  publicly_accessible     = false
  skip_final_snapshot     = true
  deletion_protection     = false
  backup_retention_period = 3

  tags = {
    Name = "${var.project_name}-postgres"
  }
}

resource "aws_secretsmanager_secret" "database" {
  name        = "${var.project_name}/database"
  description = "Connection details for the starter PostgreSQL database."

  tags = {
    Name = "${var.project_name}-database-secret"
  }
}

resource "aws_secretsmanager_secret_version" "database" {
  secret_id = aws_secretsmanager_secret.database.id

  secret_string = jsonencode({
    engine   = "postgres"
    host     = aws_db_instance.this.address
    port     = aws_db_instance.this.port
    dbname   = var.db_name
    username = var.db_username
    password = var.db_password
  })
}
