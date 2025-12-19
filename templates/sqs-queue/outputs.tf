output "queue_url" {
  description = "Queue URL."
  value       = module.sqs.queue_url
}

output "queue_arn" {
  description = "Queue ARN."
  value       = module.sqs.queue_arn
}

output "dlq_arn" {
  description = "DLQ ARN."
  value       = module.sqs.dlq_arn
}
