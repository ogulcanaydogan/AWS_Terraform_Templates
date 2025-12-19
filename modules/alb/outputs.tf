output "load_balancer_arn" {
  description = "ALB ARN."
  value       = aws_lb.this.arn
}

output "load_balancer_dns_name" {
  description = "ALB DNS name."
  value       = aws_lb.this.dns_name
}

output "target_group_arn" {
  description = "Target group ARN."
  value       = aws_lb_target_group.this.arn
}

output "listener_arn" {
  description = "Listener ARN."
  value       = aws_lb_listener.http.arn
}
