# S3 Static Website + CloudFront + ACM + Route53

## What it creates
- S3 bucket for website content with access logs
- CloudFront distribution with Origin Access Control
- ACM certificate (us-east-1) with DNS validation
- Route53 alias records for the domain

## Diagram
```
Route53 -> CloudFront -> S3 (private)
                      -> Logs bucket
```

## Prerequisites
- AWS credentials configured
- Route53 hosted zone for the domain
- Terraform >= 1.6

## Variables
| Name | Description | Type | Default |
|------|-------------|------|---------|
| region | AWS region | string | us-east-1 |
| name | Base name | string | static-site |
| domain_name | Domain name | string | n/a |
| hosted_zone_id | Route53 hosted zone ID | string | n/a |
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
- CloudFront, Route53, and S3 storage/requests incur charges.
