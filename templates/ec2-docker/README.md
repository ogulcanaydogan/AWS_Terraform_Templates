# EC2 Docker Host (SSM)

## What it creates
- EC2 instance with Docker installed
- Security group allowing HTTP/HTTPS and app ports
- IAM role + instance profile for SSM access

## Diagram
```
Internet -> SG (80/443/8080/5000) -> EC2 (Docker)
                      |
                   SSM Role
```

## Prerequisites
- AWS credentials configured
- Terraform >= 1.6

## Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| region | AWS region | string | us-east-1 |
| name | Base name | string | ec2-docker |
| allowed_ingress_cidrs | Allowed CIDRs | list(string) | ["0.0.0.0/0"] |
| instance_type | EC2 type | string | t3.micro |
| tags | Resource tags | map(string) | project/env/owner |

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
- EC2 and data transfer charges apply. Use small instance types to reduce cost.
