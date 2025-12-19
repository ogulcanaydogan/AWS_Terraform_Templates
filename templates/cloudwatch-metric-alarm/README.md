# CloudWatch Log Metric Filter + Alarm

## What it creates
- CloudWatch log group
- Metric filter on a pattern
- CloudWatch alarm with SNS email notification

## Diagram
```
Log Group -> Metric Filter -> Alarm -> SNS Email
```

## Prerequisites
- AWS credentials configured
- Confirm email subscription after apply
- Terraform >= 1.6

## Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| region | AWS region | string | us-east-1 |
| name | Base name | string | log-metric |
| filter_pattern | Filter pattern | string | ERROR |
| alarm_email | Notification email | string | n/a |
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
- CloudWatch and SNS usage charges apply.
