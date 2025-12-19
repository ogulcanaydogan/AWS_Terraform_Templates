# S3 Bucket with Lifecycle, Encryption, and Access Logs

## What it creates
- S3 bucket with versioning and encryption
- Lifecycle rules for transition and expiration
- Access log bucket

## Diagram
```
S3 Bucket -> Access Logs Bucket
```

## Prerequisites
- AWS credentials configured
- Terraform >= 1.6

## Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| region | AWS region | string | us-east-1 |
| bucket_name | Bucket name | string | n/a |
| log_bucket_name | Log bucket name | string | n/a |
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
- S3 storage, requests, and lifecycle transitions incur charges.
