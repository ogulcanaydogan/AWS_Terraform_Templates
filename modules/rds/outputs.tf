output "db_instance_id" {
  description = "DB instance ID."
  value       = aws_db_instance.this.id
}

output "db_endpoint" {
  description = "DB endpoint."
  value       = aws_db_instance.this.address
}

output "db_arn" {
  description = "DB ARN."
  value       = aws_db_instance.this.arn
}
