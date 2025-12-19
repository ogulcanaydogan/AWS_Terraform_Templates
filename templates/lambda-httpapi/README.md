# Lambda + API Gateway HTTP API

## What it creates
- Lambda function with CloudWatch logs
- HTTP API Gateway with Lambda proxy integration
- IAM role for Lambda

## Diagram
```
Client -> HTTP API -> Lambda
```

## Prerequisites
- AWS credentials configured
- Terraform >= 1.6

## Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| region | AWS region | string | us-east-1 |
| name | Base name | string | lambda-httpapi |
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
- Lambda and API Gateway charges apply per request and duration.
