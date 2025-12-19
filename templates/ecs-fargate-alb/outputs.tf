output "alb_dns_name" {
  description = "ALB DNS name."
  value       = module.alb.load_balancer_dns_name
}

output "ecs_cluster_arn" {
  description = "ECS cluster ARN."
  value       = module.ecs.cluster_arn
}
