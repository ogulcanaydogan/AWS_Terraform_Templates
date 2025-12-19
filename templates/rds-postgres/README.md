# RDS Postgres (Private Subnets)

## What it creates
- VPC with private subnets
- Security group for Postgres
- RDS Postgres instance + parameter group

## Diagram
```
VPC (private) -> RDS Postgres
```

## Prerequisites
- AWS credentials configured
- Terraform >= 1.6

## Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| region | AWS region | string | us-east-1 |
| name | DB identifier | string | rds-postgres |
| cidr_block | VPC CIDR | string | 10.4.0.0/16 |
| azs | Availability zones | list(string) | us-east-1a/b |
| private_subnet_cidrs | Private subnet CIDRs | list(string) | 10.4.101.0/24, 10.4.102.0/24 |
| db_name | Database name | string | appdb |
| db_username | Username | string | appuser |
| db_password | Password | string | n/a |
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
- RDS instances incur hourly and storage charges.
