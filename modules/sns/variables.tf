variable "name" {
  type        = string
  description = "SNS topic name."
}

variable "subscriptions" {
  type = list(object({
    protocol = string
    endpoint = string
  }))
  default     = []
  description = "Subscriptions."
}

variable "tags" {
  type        = map(string)
  description = "Tags."
  default     = {}
}
