resource "aws_lb" "silly_demo_lb" {
  name               = "silly-demo-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.silly_demo_lb_sg.id]
  subnets            = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]

  enable_deletion_protection = false
  enable_cross_zone_load_balancing = true

  tags = {
    Name = "silly-demo-alb"
  }
}

resource "aws_lb_target_group" "silly_demo_target_group" {
  name     = "silly-demo-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  tags = {
    Name = "silly-demo-target-group"
  }
}
