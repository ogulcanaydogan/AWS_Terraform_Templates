variable "name" {
  type        = string
  description = "Queue name."
}

variable "create_dlq" {
  type        = bool
  description = "Create DLQ."
  default     = true
}

variable "dlq_max_receive_count" {
  type        = number
  description = "Max receive count before redrive."
  default     = 5
}

variable "tags" {
  type        = map(string)
  description = "Tags."
  default     = {}
}
