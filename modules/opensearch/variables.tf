variable "name" {
  type        = string
  description = "Domain name."
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for VPC access."
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs."
}

variable "instance_type" {
  type        = string
  description = "Instance type."
  default     = "t3.small.search"
}

variable "instance_count" {
  type        = number
  description = "Instance count."
  default     = 1
}

variable "tags" {
  type        = map(string)
  description = "Tags."
  default     = {}
}
