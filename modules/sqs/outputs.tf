output "queue_url" {
  description = "Queue URL."
  value       = aws_sqs_queue.this.url
}

output "queue_arn" {
  description = "Queue ARN."
  value       = aws_sqs_queue.this.arn
}

output "dlq_arn" {
  description = "DLQ ARN."
  value       = try(aws_sqs_queue.dlq[0].arn, null)
}
