output "cloudfront_domain" {
  description = "CloudFront domain name."
  value       = aws_cloudfront_distribution.this.domain_name
}

output "bucket_name" {
  description = "S3 bucket name."
  value       = aws_s3_bucket.site.id
}
