
# Security group for ALB
resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Allow HTTP"
  vpc_id      = module.vpc[0].vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security group for EC2
resource "aws_security_group" "lb_ec2_sg" {
  name        = "ec2-sg"
  description = "Allow HTTP from ALB"
  vpc_id      = module.vpc[0].vpc_id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Launch template for EC2
resource "aws_launch_template" "web" {
  name_prefix   = "web-"
  image_id      = data.aws_ami.al2.id # -08c40ec9ead489470" # Amazon Linux 2 in us-east-1 (replace if needed)
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.lb_ec2_sg.id]

  user_data = base64encode(<<-EOF
              #!/bin/bash
              echo "Hello World from \$(hostname)" > /var/www/html/index.html
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              cp /var/www/html/index.html /var/www/html/index.html
              EOF
  )
}

# Load Balancer
resource "aws_lb" "app_lb" {
  name               = "app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = module.vpc[0].public_subnets
}

output "LB_DNS" {
    value = aws_lb.app_lb.dns_name
}

resource "aws_lb_target_group" "app_tg" {
  name     = "app-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc[0].vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}

# Auto Scaling Group
resource "aws_autoscaling_group" "asg" {
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1

  vpc_zone_identifier = module.vpc[0].public_subnets

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.app_tg.arn]

  health_check_type         = "ELB"
  health_check_grace_period = 30

  lifecycle {
    create_before_destroy = true
  }
}