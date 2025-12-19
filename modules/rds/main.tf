locals {
  tags = var.tags
}

resource "aws_db_subnet_group" "this" {
  name       = "${var.name}-subnet"
  subnet_ids = var.subnet_ids

  tags = merge(local.tags, {
    Name = "${var.name}-subnet"
  })
}

resource "aws_db_parameter_group" "this" {
  name   = "${var.name}-pg"
  family = "postgres15"

  parameter {
    name  = "log_statement"
    value = "ddl"
  }

  tags = merge(local.tags, {
    Name = "${var.name}-pg"
  })
}

resource "aws_db_instance" "this" {
  identifier              = var.name
  engine                  = "postgres"
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  db_name                 = var.db_name
  username                = var.username
  password                = var.password
  allocated_storage       = var.allocated_storage
  storage_encrypted       = true
  publicly_accessible     = false
  vpc_security_group_ids  = var.vpc_security_group_ids
  db_subnet_group_name    = aws_db_subnet_group.this.name
  parameter_group_name    = aws_db_parameter_group.this.name
  skip_final_snapshot     = true
  backup_retention_period = 7

  tags = merge(local.tags, {
    Name = var.name
  })
}
