resource "aws_security_group" "ec2_sg" {
  vpc_id = var.vpc_id

  # SSH from Bastion (if provided)
  dynamic "ingress" {
    for_each = var.allowed_ssh_sg_id != null ? [1] : []
    content {
      from_port       = 22
      to_port         = 22
      protocol        = "tcp"
      security_groups = [var.allowed_ssh_sg_id]
    }
  }

  # SSH open (only if no bastion SG provided)
  dynamic "ingress" {
    for_each = var.allowed_ssh_sg_id == null ? [1] : []
    content {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # HTTP
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

resource "aws_instance" "server" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "${var.env}-server"
  }
}