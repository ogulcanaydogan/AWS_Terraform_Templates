# IAM User/Role Policy Examples

## What it creates
- IAM user with read-only S3 access
- IAM role with limited S3 write access
- Instance profile for the role

## Diagram
```
IAM User -> Read-only S3 Policy
EC2 Role -> Limited S3 Write Policy
```

## Prerequisites
- AWS credentials configured
- Terraform >= 1.6

## Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| region | AWS region | string | us-east-1 |
| name | Base name | string | iam-examples |
| s3_bucket_arn | S3 bucket ARN | string | n/a |
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
- IAM is free, but attached services may incur costs.
