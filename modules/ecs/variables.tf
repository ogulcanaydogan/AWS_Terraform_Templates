variable "name" {
  type        = string
  description = "Service name."
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnets for service."
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs."
}

variable "task_cpu" {
  type        = string
  description = "Task CPU."
  default     = "256"
}

variable "task_memory" {
  type        = string
  description = "Task memory."
  default     = "512"
}

variable "container_image" {
  type        = string
  description = "Container image."
}

variable "container_port" {
  type        = number
  description = "Container port."
}

variable "desired_count" {
  type        = number
  description = "Desired count."
  default     = 1
}

variable "execution_role_arn" {
  type        = string
  description = "Execution role ARN."
}

variable "task_role_arn" {
  type        = string
  description = "Task role ARN."
}

variable "log_group_name" {
  type        = string
  description = "CloudWatch log group name."
}

variable "target_group_arn" {
  type        = string
  description = "ALB target group ARN."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Tags."
  default     = {}
}
