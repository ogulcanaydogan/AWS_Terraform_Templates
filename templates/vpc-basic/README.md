# VPC Public + Private Subnets

## What it creates
- VPC with public and private subnets
- Internet gateway, NAT gateway, and route tables

## Diagram
```
Public Subnets -> IGW
Private Subnets -> NAT -> IGW
```

## Prerequisites
- AWS credentials configured
- Terraform >= 1.6

## Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| region | AWS region | string | us-east-1 |
| name | VPC name | string | vpc-basic |
| cidr_block | VPC CIDR | string | 10.0.0.0/16 |
| azs | Availability zones | list(string) | us-east-1a/b |
| public_subnet_cidrs | Public subnet CIDRs | list(string) | 10.0.1.0/24, 10.0.2.0/24 |
| private_subnet_cidrs | Private subnet CIDRs | list(string) | 10.0.101.0/24, 10.0.102.0/24 |
| tags | Tags | map(string) | project/env/owner |

## How to run
```bash
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform apply
```

## How to destroy
```bash
terraform destroy
```

## Cost notes
- NAT Gateway incurs hourly and data processing charges.
