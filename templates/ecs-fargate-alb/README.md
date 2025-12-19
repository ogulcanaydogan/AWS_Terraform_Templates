# ECS Fargate Service Behind ALB

## What it creates
- VPC with public/private subnets and NAT
- Application Load Balancer
- ECS Fargate cluster, task definition, and service
- CloudWatch log group

## Diagram
```
Internet -> ALB -> ECS Fargate Service (private subnets)
```

## Prerequisites
- AWS credentials configured
- Terraform >= 1.6

## Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| region | AWS region | string | us-east-1 |
| name | Base name | string | ecs-fargate |
| cidr_block | VPC CIDR | string | 10.3.0.0/16 |
| azs | Availability zones | list(string) | us-east-1a/b |
| public_subnet_cidrs | Public subnet CIDRs | list(string) | 10.3.1.0/24, 10.3.2.0/24 |
| private_subnet_cidrs | Private subnet CIDRs | list(string) | 10.3.101.0/24, 10.3.102.0/24 |
| container_image | Container image | string | nginx |
| container_port | Container port | number | 80 |
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
- ALB, NAT Gateway, and ECS Fargate charges apply.
