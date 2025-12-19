locals {
  tags = var.tags
}

module "sqs" {
  source                = "../../modules/sqs"
  name                  = var.name
  create_dlq            = var.create_dlq
  dlq_max_receive_count = var.dlq_max_receive_count
  tags                  = local.tags
}
