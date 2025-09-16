# 🔹 IAM Role for EC2 so SSM can manage it
resource "aws_iam_role" "ssm" {
  name = "ec2-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_role" {
  role       = aws_iam_role.ssm.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# 🔹 Instance Profile for EC2
resource "aws_iam_instance_profile" "ssm_instance_profile" {
  name = "ec2-ssm-instance-profile"
  role = aws_iam_role.ssm.name
}

# 🔹 Security Group
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-ssm-sg"
  description = "Allow outbound traffic only"
  vpc_id      = module.vpc[0].vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 🔹 EC2 Instance
resource "aws_instance" "ec2" {
  ami                    = data.aws_ami.al2.id # "ami-0c7217cdde317cfec" # Amazon Linux 2 AMI (example, region-specific)
  instance_type          = "t2.micro"
  iam_instance_profile   = aws_iam_instance_profile.ssm_instance_profile.name
  subnet_id              = module.vpc[0].public_subnets[0] # replace with your subnet ID
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "ssm-demo-instance"
  }
}

output ec2_instance {
    value = aws_instance.ec2.id
}

# 🔹 Find the latest Amazon Linux 2 AMI
data "aws_ami" "al2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Amazon's official AWS account ID
}
