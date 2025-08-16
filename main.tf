# Security Group in Primary Region
resource "aws_security_group" "demo_sg" {
  name        = "demo-sg"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
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

# EC2 Instance in Primary Region
resource "aws_instance" "demo_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  security_groups = [aws_security_group.demo_sg.name]

  tags = {
    Name = "Terraform-Primary"
  }
}

# EC2 Instance in Secondary Region
resource "aws_instance" "demo_instance_secondary" {
  provider      = aws.secondary
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "Terraform-Secondary"
  }
}
