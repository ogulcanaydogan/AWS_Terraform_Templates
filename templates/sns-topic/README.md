# SNS Topic + Subscription

## What it creates
- SNS topic
- Optional subscriptions

## Diagram
```
Publisher -> SNS Topic -> Subscription
```

## Prerequisites
- AWS credentials configured
- Terraform >= 1.6

## Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| region | AWS region | string | us-east-1 |
| name | Topic name | string | app-topic |
| subscriptions | List of subscriptions | list(object) | [] |
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
- SNS usage incurs request and delivery charges.
