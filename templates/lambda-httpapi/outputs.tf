output "api_endpoint" {
  description = "HTTP API endpoint."
  value       = aws_apigatewayv2_api.this.api_endpoint
}

output "lambda_arn" {
  description = "Lambda ARN."
  value       = module.lambda.function_arn
}
