# Auto Scaling Group Behind ALB

## What it creates
- VPC with public/private subnets and NAT
- Application Load Balancer
- Auto Scaling Group with Amazon Linux instances

## Diagram
```
Internet -> ALB -> ASG (private subnets)
```

## Prerequisites
- AWS credentials configured
- Terraform >= 1.6

## Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| region | AWS region | string | us-east-1 |
| name | Base name | string | asg-alb |
| cidr_block | VPC CIDR | string | 10.2.0.0/16 |
| azs | Availability zones | list(string) | us-east-1a/b |
| public_subnet_cidrs | Public subnet CIDRs | list(string) | 10.2.1.0/24, 10.2.2.0/24 |
| private_subnet_cidrs | Private subnet CIDRs | list(string) | 10.2.101.0/24, 10.2.102.0/24 |
| instance_type | EC2 type | string | t3.micro |
| desired_capacity | Desired capacity | number | 2 |
| min_size | Minimum size | number | 1 |
| max_size | Maximum size | number | 3 |
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
- ALB and NAT Gateway incur hourly charges.
