output "vpc_id" {
  description = "VPC ID."
  value       = module.vpc.vpc_id
}

output "s3_endpoint_id" {
  description = "S3 endpoint ID."
  value       = aws_vpc_endpoint.s3.id
}

output "dynamodb_endpoint_id" {
  description = "DynamoDB endpoint ID."
  value       = aws_vpc_endpoint.dynamodb.id
}
