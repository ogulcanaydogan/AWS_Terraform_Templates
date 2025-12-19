output "alb_dns_name" {
  description = "ALB DNS name."
  value       = module.alb.load_balancer_dns_name
}

output "asg_name" {
  description = "Auto Scaling Group name."
  value       = aws_autoscaling_group.this.name
}
