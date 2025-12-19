output "domain_endpoint" {
  description = "OpenSearch endpoint."
  value       = module.opensearch.domain_endpoint
}

output "domain_arn" {
  description = "OpenSearch ARN."
  value       = module.opensearch.domain_arn
}
