locals {
  tags = var.tags
}

module "ecr" {
  source = "../../modules/ecr"
  name   = var.name
  tags   = local.tags
}
