output "function_arn" {
  description = "Lambda ARN."
  value       = aws_lambda_function.this.arn
}

output "invoke_arn" {
  description = "Lambda invoke ARN."
  value       = aws_lambda_function.this.invoke_arn
}
