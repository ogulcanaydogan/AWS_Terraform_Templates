output "vpc_id" {
  description = "VPC ID."
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "Public subnet IDs."
  value       = [for subnet in aws_subnet.public : subnet.id]
}

output "private_subnet_ids" {
  description = "Private subnet IDs."
  value       = [for subnet in aws_subnet.private : subnet.id]
}

output "igw_id" {
  description = "Internet gateway ID."
  value       = aws_internet_gateway.this.id
}

output "nat_gateway_id" {
  description = "NAT gateway ID (if enabled)."
  value       = try(aws_nat_gateway.this[0].id, null)
}

output "public_route_table_id" {
  description = "Public route table ID."
  value       = aws_route_table.public.id
}

output "private_route_table_ids" {
  description = "Private route table IDs."
  value       = [for rt in aws_route_table.private : rt.id]
}
