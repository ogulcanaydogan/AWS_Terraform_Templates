variable "name" {
  type        = string
  description = "Instance name."
}

variable "ami_id" {
  type        = string
  description = "AMI ID."
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type."
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID."
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs."
}

variable "iam_instance_profile" {
  type        = string
  description = "IAM instance profile name."
}

variable "user_data" {
  type        = string
  description = "User data script."
  default     = null
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Associate public IP."
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply."
  default     = {}
}
