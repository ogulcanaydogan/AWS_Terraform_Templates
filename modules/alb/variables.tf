variable "name" {
  type        = string
  description = "ALB name."
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for ALB."
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs."
}

variable "vpc_id" {
  type        = string
  description = "VPC ID."
}

variable "target_port" {
  type        = number
  description = "Target port."
}

variable "target_protocol" {
  type        = string
  description = "Target protocol."
  default     = "HTTP"
}

variable "target_type" {
  type        = string
  description = "Target type (instance or ip)."
  default     = "instance"
}

variable "health_check_path" {
  type        = string
  description = "Health check path."
  default     = "/"
}

variable "tags" {
  type        = map(string)
  description = "Tags."
  default     = {}
}
