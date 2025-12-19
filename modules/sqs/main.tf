locals {
  tags = var.tags
}

resource "aws_sqs_queue" "dlq" {
  count = var.create_dlq ? 1 : 0
  name  = "${var.name}-dlq"

  message_retention_seconds = 1209600

  tags = merge(local.tags, {
    Name = "${var.name}-dlq"
  })
}

resource "aws_sqs_queue" "this" {
  name = var.name

  redrive_policy = var.create_dlq ? jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq[0].arn
    maxReceiveCount     = var.dlq_max_receive_count
  }) : null

  tags = merge(local.tags, {
    Name = var.name
  })
}
