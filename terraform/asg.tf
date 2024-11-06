resource "aws_autoscaling_group" "silly_demo_asg" {
  desired_capacity     = 1
  max_size             = 2
  min_size             = 1
  vpc_zone_identifier  = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]

  launch_template {
    name    = aws_launch_template.silly_demo.name
    version = "$Latest"
  }

  health_check_type           = "EC2"
  health_check_grace_period  = 300
  force_delete                = true
  wait_for_capacity_timeout   = "0"
}
