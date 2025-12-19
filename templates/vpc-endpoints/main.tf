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
  enable_nat_gateway   = false
  tags                 = local.tags
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = concat([module.vpc.public_route_table_id], module.vpc.private_route_table_ids)

  tags = merge(local.tags, {
    Name = "${local.name}-s3-endpoint"
  })
}

resource "aws_vpc_endpoint" "dynamodb" {
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.${var.region}.dynamodb"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = concat([module.vpc.public_route_table_id], module.vpc.private_route_table_ids)

  tags = merge(local.tags, {
    Name = "${local.name}-dynamodb-endpoint"
  })
}
