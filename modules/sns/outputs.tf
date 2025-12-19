output "topic_arn" {
  description = "Topic ARN."
  value       = aws_sns_topic.this.arn
}
