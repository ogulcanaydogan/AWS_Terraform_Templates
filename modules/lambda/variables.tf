variable "name" {
  type        = string
  description = "Lambda name."
}

variable "handler" {
  type        = string
  description = "Handler."
}

variable "runtime" {
  type        = string
  description = "Runtime."
  default     = "nodejs20.x"
}

variable "role_arn" {
  type        = string
  description = "IAM role ARN."
}

variable "filename" {
  type        = string
  description = "Path to deployment package."
}

variable "source_code_hash" {
  type        = string
  description = "Source code hash."
}

variable "log_retention_in_days" {
  type        = number
  description = "Log retention days."
  default     = 14
}

variable "tags" {
  type        = map(string)
  description = "Tags."
  default     = {}
}
