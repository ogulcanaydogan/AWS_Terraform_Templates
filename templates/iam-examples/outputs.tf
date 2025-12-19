output "user_name" {
  description = "IAM user name."
  value       = aws_iam_user.readonly.name
}

output "role_arn" {
  description = "IAM role ARN."
  value       = aws_iam_role.app.arn
}

output "instance_profile_name" {
  description = "Instance profile name."
  value       = aws_iam_instance_profile.app.name
}
