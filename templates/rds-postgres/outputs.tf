output "db_endpoint" {
  description = "Database endpoint."
  value       = module.rds.db_endpoint
}

output "db_arn" {
  description = "Database ARN."
  value       = module.rds.db_arn
}
