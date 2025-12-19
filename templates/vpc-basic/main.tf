locals {
  name = var.name
  tags = var.tags
}

module "vpc" {
  source               = "../../modules/vpc"
  name                 = local.name
  cidr_block           = var.cidr_block
  azs                  = var.azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  enable_nat_gateway   = true
  tags                 = local.tags
}
