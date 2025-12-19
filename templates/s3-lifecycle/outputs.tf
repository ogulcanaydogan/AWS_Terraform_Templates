output "bucket_name" {
  description = "Bucket name."
  value       = module.bucket.bucket_id
}

output "log_bucket_name" {
  description = "Log bucket name."
  value       = aws_s3_bucket.logs.id
}
