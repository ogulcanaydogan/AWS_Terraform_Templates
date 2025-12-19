locals {
  tags = var.tags
}

resource "aws_instance" "this" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  iam_instance_profile        = var.iam_instance_profile
  user_data                   = var.user_data
  associate_public_ip_address = var.associate_public_ip_address

  tags = merge(local.tags, {
    Name = var.name
  })
}
