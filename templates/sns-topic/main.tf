locals {
  tags = var.tags
}

module "sns" {
  source        = "../../modules/sns"
  name          = var.name
  subscriptions = var.subscriptions
  tags          = local.tags
}
