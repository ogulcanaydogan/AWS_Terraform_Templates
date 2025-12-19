variable "name" {
  type        = string
  description = "Role name."
}

variable "assume_role_policy" {
  type        = string
  description = "Assume role policy JSON."
}

variable "policy_json" {
  type        = string
  description = "Inline policy JSON."
  default     = null
}

variable "managed_policy_arns" {
  type        = list(string)
  description = "Managed policy ARNs to attach."
  default     = []
}

variable "create_instance_profile" {
  type        = bool
  description = "Whether to create an instance profile."
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Tags."
  default     = {}
}
