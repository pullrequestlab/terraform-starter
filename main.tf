module "network" {
  source = "./modules/network"

  project_name         = local.name_prefix
  vpc_cidr             = var.vpc_cidr
  az_count             = var.az_count
  enable_vpc_endpoints = var.enable_vpc_endpoints
}

module "security" {
  source = "./modules/security"

  project_name      = local.name_prefix
  vpc_id            = module.network.vpc_id
  vpc_cidr          = module.network.vpc_cidr
  alb_ingress_cidrs = var.alb_ingress_cidrs
  application_port  = 80
  database_port     = 5432
}

module "data" {
  source = "./modules/data"

  project_name       = local.name_prefix
  private_subnet_ids = module.network.private_subnet_ids
  database_sg_id     = module.security.database_sg_id
  db_name            = var.db_name
  db_username        = var.db_username
  db_password        = var.db_password
}

module "compute" {
  source = "./modules/compute"

  project_name        = local.name_prefix
  vpc_id              = module.network.vpc_id
  public_subnet_ids   = module.network.public_subnet_ids
  private_subnet_ids  = module.network.private_subnet_ids
  load_balancer_sg_id = module.security.load_balancer_sg_id
  service_sg_id       = module.security.service_sg_id
  container_image     = var.container_image
  desired_count       = var.service_desired_count
  database_endpoint   = module.data.database_endpoint
  database_secret_arn = module.data.database_secret_arn
}

module "observability" {
  source = "./modules/observability"

  project_name             = local.name_prefix
  alert_email              = var.alert_email
  load_balancer_arn_suffix = module.compute.load_balancer_arn_suffix
  target_group_arn_suffix  = module.compute.target_group_arn_suffix
  cluster_name             = module.compute.cluster_name
  service_name             = module.compute.service_name
}
