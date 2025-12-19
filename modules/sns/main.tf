locals {
  tags = var.tags
}

resource "aws_sns_topic" "this" {
  name = var.name

  tags = merge(local.tags, {
    Name = var.name
  })
}

resource "aws_sns_topic_subscription" "this" {
  for_each  = { for idx, sub in var.subscriptions : idx => sub }
  topic_arn = aws_sns_topic.this.arn
  protocol  = each.value.protocol
  endpoint  = each.value.endpoint
}
