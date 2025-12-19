variable "name" {
  type        = string
  description = "Base name for VPC resources."
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC."
}

variable "azs" {
  type        = list(string)
  description = "Availability zones for subnets."
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for public subnets."
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for private subnets."
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Whether to create a NAT gateway for private subnets."
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources."
  default     = {}
}
