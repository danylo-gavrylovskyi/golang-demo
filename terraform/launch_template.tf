resource "aws_launch_template" "silly_demo" {
  name          = "silly-demo-launch-template"
  image_id      = "ami-0866a3c8686eaeeba"  # Replace with your desired AMI ID
  instance_type = "t2.micro"

  user_data = base64encode("#!/bin/bash\necho Hello World")

  lifecycle {
    create_before_destroy = true
  }
}
