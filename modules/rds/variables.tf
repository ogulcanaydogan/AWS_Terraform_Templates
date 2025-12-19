variable "name" {
  type        = string
  description = "RDS identifier."
}

variable "engine_version" {
  type        = string
  description = "Postgres engine version."
  default     = "15.4"
}

variable "instance_class" {
  type        = string
  description = "Instance class."
  default     = "db.t3.micro"
}

variable "db_name" {
  type        = string
  description = "Database name."
}

variable "username" {
  type        = string
  description = "Master username."
}

variable "password" {
  type        = string
  description = "Master password."
  sensitive   = true
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for DB subnet group."
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "Security group IDs."
}

variable "allocated_storage" {
  type        = number
  description = "Allocated storage in GB."
  default     = 20
}

variable "tags" {
  type        = map(string)
  description = "Tags."
  default     = {}
}
