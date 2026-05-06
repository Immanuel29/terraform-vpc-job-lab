data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_security_group" "ec2" {
  name        = "${var.project_name}-ec2-sg"
  description = "Security group for EC2 instance"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name        = "${var.project_name}-ec2-sg"
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_instance" "main" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  vpc_security_group_ids = [aws_security_group.ec2.id]

  tags = {
    Name        = "${var.project_name}-ec2"
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}
