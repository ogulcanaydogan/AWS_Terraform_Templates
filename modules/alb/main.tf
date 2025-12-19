locals {
  tags = var.tags
}

resource "aws_lb" "this" {
  name               = var.name
  load_balancer_type = "application"
  security_groups    = var.security_group_ids
  subnets            = var.subnet_ids

  tags = merge(local.tags, {
    Name = var.name
  })
}

resource "aws_lb_target_group" "this" {
  name        = "${var.name}-tg"
  port        = var.target_port
  protocol    = var.target_protocol
  vpc_id      = var.vpc_id
  target_type = var.target_type

  health_check {
    path = var.health_check_path
  }

  tags = merge(local.tags, {
    Name = "${var.name}-tg"
  })
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}
