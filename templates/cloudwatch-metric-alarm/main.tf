locals {
  name = var.name
  tags = var.tags
}

resource "aws_cloudwatch_log_group" "this" {
  name              = "/app/${local.name}"
  retention_in_days = 14

  tags = local.tags
}

resource "aws_cloudwatch_log_metric_filter" "this" {
  name           = "${local.name}-filter"
  log_group_name = aws_cloudwatch_log_group.this.name
  pattern        = var.filter_pattern

  metric_transformation {
    name      = "${local.name}-errors"
    namespace = "LogMetrics"
    value     = "1"
  }
}

resource "aws_sns_topic" "alarm" {
  name = "${local.name}-alarm"

  tags = local.tags
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.alarm.arn
  protocol  = "email"
  endpoint  = var.alarm_email
}

resource "aws_cloudwatch_metric_alarm" "this" {
  alarm_name          = "${local.name}-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = aws_cloudwatch_log_metric_filter.this.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.this.metric_transformation[0].namespace
  period              = 60
  statistic           = "Sum"
  threshold           = 1

  alarm_actions = [aws_sns_topic.alarm.arn]

  tags = local.tags
}
