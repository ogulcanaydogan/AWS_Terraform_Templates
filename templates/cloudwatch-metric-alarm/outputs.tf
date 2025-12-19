output "log_group_name" {
  description = "Log group name."
  value       = aws_cloudwatch_log_group.this.name
}

output "alarm_name" {
  description = "Alarm name."
  value       = aws_cloudwatch_metric_alarm.this.alarm_name
}
