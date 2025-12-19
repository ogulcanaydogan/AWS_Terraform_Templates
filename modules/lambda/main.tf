locals {
  tags = var.tags
}

resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/lambda/${var.name}"
  retention_in_days = var.log_retention_in_days

  tags = merge(local.tags, {
    Name = "${var.name}-logs"
  })
}

resource "aws_lambda_function" "this" {
  function_name    = var.name
  handler          = var.handler
  runtime          = var.runtime
  role             = var.role_arn
  filename         = var.filename
  source_code_hash = var.source_code_hash

  tags = merge(local.tags, {
    Name = var.name
  })
}
