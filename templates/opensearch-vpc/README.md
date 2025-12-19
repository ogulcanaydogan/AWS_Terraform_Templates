# OpenSearch Domain (VPC)

## What it creates
- VPC with private subnets
- Security group for OpenSearch
- OpenSearch domain with VPC access

## Diagram
```
VPC (private) -> OpenSearch Domain
```

## Prerequisites
- AWS credentials configured
- Terraform >= 1.6

## Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| region | AWS region | string | us-east-1 |
| name | Domain name | string | opensearch-demo |
| cidr_block | VPC CIDR | string | 10.5.0.0/16 |
| azs | Availability zones | list(string) | us-east-1a/b |
| private_subnet_cidrs | Private subnet CIDRs | list(string) | 10.5.101.0/24, 10.5.102.0/24 |
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
- OpenSearch instances and EBS storage incur charges.
