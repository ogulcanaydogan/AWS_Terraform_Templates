locals {
  name = var.name
  tags = var.tags
}

module "vpc" {
  source               = "../../modules/vpc"
  name                 = local.name
  cidr_block           = var.cidr_block
  azs                  = var.azs
  public_subnet_cidrs  = ["10.5.1.0/24", "10.5.2.0/24"]
  private_subnet_cidrs = var.private_subnet_cidrs
  enable_nat_gateway   = false
  tags                 = local.tags
}

module "opensearch_sg" {
  source      = "../../modules/sg"
  name        = "${local.name}-sg"
  description = "OpenSearch security group"
  vpc_id      = module.vpc.vpc_id
  ingress_rules = [
    {
      description = "HTTPS from VPC"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = [var.cidr_block]
    }
  ]
  tags = local.tags
}

module "opensearch" {
  source             = "../../modules/opensearch"
  name               = local.name
  subnet_ids         = module.vpc.private_subnet_ids
  security_group_ids = [module.opensearch_sg.security_group_id]
  tags               = local.tags
}
