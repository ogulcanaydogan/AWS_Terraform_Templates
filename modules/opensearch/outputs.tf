output "domain_endpoint" {
  description = "Domain endpoint."
  value       = aws_opensearch_domain.this.endpoint
}

output "domain_arn" {
  description = "Domain ARN."
  value       = aws_opensearch_domain.this.arn
}
