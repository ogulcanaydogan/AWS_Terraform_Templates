# VPC Endpoints (S3 + DynamoDB)

## What it creates
- VPC with public and private subnets
- Gateway endpoints for S3 and DynamoDB

## Diagram
```
VPC
├─ Public Subnets
├─ Private Subnets
└─ Gateway Endpoints (S3, DynamoDB)
```

## Prerequisites
- AWS credentials configured
- Terraform >= 1.6

## Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| region | AWS region | string | us-east-1 |
| name | Base name | string | vpc-endpoints |
| cidr_block | VPC CIDR | string | 10.1.0.0/16 |
| azs | Availability zones | list(string) | us-east-1a/b |
| public_subnet_cidrs | Public subnet CIDRs | list(string) | 10.1.1.0/24, 10.1.2.0/24 |
| private_subnet_cidrs | Private subnet CIDRs | list(string) | 10.1.101.0/24, 10.1.102.0/24 |
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
- VPC endpoints incur hourly charges per AZ.
