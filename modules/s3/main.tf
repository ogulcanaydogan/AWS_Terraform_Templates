locals {
  tags = var.tags
}

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = merge(local.tags, {
    Name = var.bucket_name
  })
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_logging" "this" {
  count = var.log_bucket == null ? 0 : 1

  bucket        = aws_s3_bucket.this.id
  target_bucket = var.log_bucket
  target_prefix = var.log_prefix
}

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  count  = length(var.lifecycle_rules) > 0 ? 1 : 0
  bucket = aws_s3_bucket.this.id

  dynamic "rule" {
    for_each = var.lifecycle_rules
    content {
      id     = rule.value.id
      status = rule.value.enabled ? "Enabled" : "Disabled"

      dynamic "expiration" {
        for_each = rule.value.expiration_days == null ? [] : [rule.value.expiration_days]
        content {
          days = expiration.value
        }
      }

      dynamic "transition" {
        for_each = rule.value.transition_days == null ? [] : [rule.value]
        content {
          days          = transition.value.transition_days
          storage_class = transition.value.transition_storage_class
        }
      }
    }
  }
}

resource "aws_s3_bucket_website_configuration" "this" {
  count  = var.website == null ? 0 : 1
  bucket = aws_s3_bucket.this.id

  index_document {
    suffix = var.website.index_document
  }

  dynamic "error_document" {
    for_each = var.website.error_document == null ? [] : [var.website.error_document]
    content {
      key = error_document.value
    }
  }
}
