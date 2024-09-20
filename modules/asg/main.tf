# ASG Main

resource "aws_launch_template" "app" {
  name_prefix = "app-launch-template"
  image_id    = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  user_data = <<-EOF
              #!/bin/bash
              amazon-linux-extras install nginx1
              systemctl start nginx
              echo "Welcome to the Web App" > /usr/share/nginx/html/index.html
              EOF
}

resource "aws_autoscaling_group" "asg" {
  name                 = var.name
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  vpc_zone_identifier  = var.private_subnets
  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }
  //target_group_arns = [var.target_group_arn]
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
