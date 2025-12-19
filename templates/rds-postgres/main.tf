locals {
  name = var.name
  tags = var.tags
}

module "vpc" {
  source               = "../../modules/vpc"
  name                 = local.name
  cidr_block           = var.cidr_block
  azs                  = var.azs
  public_subnet_cidrs  = ["10.4.1.0/24", "10.4.2.0/24"]
  private_subnet_cidrs = var.private_subnet_cidrs
  enable_nat_gateway   = false
  tags                 = local.tags
}

module "db_sg" {
  source      = "../../modules/sg"
  name        = "${local.name}-db-sg"
  description = "RDS security group"
  vpc_id      = module.vpc.vpc_id
  ingress_rules = [
    {
      description = "Postgres"
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = [var.cidr_block]
    }
  ]
  tags = local.tags
}

module "rds" {
  source                 = "../../modules/rds"
  name                   = local.name
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  subnet_ids             = module.vpc.private_subnet_ids
  vpc_security_group_ids = [module.db_sg.security_group_id]
  tags                   = local.tags
}
