# Security Group for the Load Balancer
resource "aws_security_group" "silly_demo_lb_sg" {
  name        = "silly-demo-lb-sg"
  description = "Allow HTTP access to the load balancer"
  vpc_id      = aws_vpc.main.id  # Ensure this matches the VPC ID you created in vpc.tf

  # Allow inbound HTTP traffic on port 80
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "silly-demo-lb-sg"
  }
}
