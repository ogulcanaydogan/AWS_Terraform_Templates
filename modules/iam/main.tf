locals {
  tags = var.tags
}

resource "aws_iam_role" "this" {
  name               = var.name
  assume_role_policy = var.assume_role_policy

  tags = merge(local.tags, {
    Name = var.name
  })
}

resource "aws_iam_policy" "inline" {
  count  = var.policy_json == null ? 0 : 1
  name   = "${var.name}-policy"
  policy = var.policy_json

  tags = merge(local.tags, {
    Name = "${var.name}-policy"
  })
}

resource "aws_iam_role_policy_attachment" "inline" {
  count      = var.policy_json == null ? 0 : 1
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.inline[0].arn
}

resource "aws_iam_role_policy_attachment" "managed" {
  for_each   = toset(var.managed_policy_arns)
  role       = aws_iam_role.this.name
  policy_arn = each.value
}

resource "aws_iam_instance_profile" "this" {
  count = var.create_instance_profile ? 1 : 0

  name = "${var.name}-profile"
  role = aws_iam_role.this.name

  tags = merge(local.tags, {
    Name = "${var.name}-profile"
  })
}
