# SQS Queue + DLQ

## What it creates
- SQS queue
- Optional dead-letter queue

## Diagram
```
Producer -> SQS Queue -> DLQ
```

## Prerequisites
- AWS credentials configured
- Terraform >= 1.6

## Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| region | AWS region | string | us-east-1 |
| name | Queue name | string | app-queue |
| create_dlq | Create DLQ | bool | true |
| dlq_max_receive_count | Max receive count | number | 5 |
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
- SQS requests and data transfer incur charges.
