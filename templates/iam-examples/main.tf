locals {
  name = var.name
  tags = var.tags
}

resource "aws_iam_user" "readonly" {
  name = "${local.name}-user"
  tags = local.tags
}

resource "aws_iam_policy" "readonly_s3" {
  name   = "${local.name}-s3-readonly"
  policy = data.aws_iam_policy_document.readonly_s3.json
  tags   = local.tags
}

resource "aws_iam_user_policy_attachment" "readonly_attach" {
  user       = aws_iam_user.readonly.name
  policy_arn = aws_iam_policy.readonly_s3.arn
}

resource "aws_iam_role" "app" {
  name               = "${local.name}-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
  tags               = local.tags
}

resource "aws_iam_policy" "app_write" {
  name   = "${local.name}-app-write"
  policy = data.aws_iam_policy_document.app_write.json
  tags   = local.tags
}

resource "aws_iam_role_policy_attachment" "app_attach" {
  role       = aws_iam_role.app.name
  policy_arn = aws_iam_policy.app_write.arn
}

resource "aws_iam_instance_profile" "app" {
  name = "${local.name}-profile"
  role = aws_iam_role.app.name
  tags = local.tags
}

data "aws_iam_policy_document" "readonly_s3" {
  statement {
    actions   = ["s3:GetObject", "s3:ListBucket"]
    resources = [var.s3_bucket_arn, "${var.s3_bucket_arn}/*"]
  }
}

data "aws_iam_policy_document" "app_write" {
  statement {
    actions   = ["s3:PutObject", "s3:GetObject"]
    resources = ["${var.s3_bucket_arn}/*"]
  }
}

data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}
