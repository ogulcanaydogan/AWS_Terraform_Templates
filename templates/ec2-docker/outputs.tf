output "instance_id" {
  description = "EC2 instance ID."
  value       = module.docker_instance.instance_id
}

output "public_ip" {
  description = "Public IP."
  value       = module.docker_instance.public_ip
}

output "ssm_start_session" {
  description = "SSM start-session command."
  value       = "aws ssm start-session --target ${module.docker_instance.instance_id}"
}
