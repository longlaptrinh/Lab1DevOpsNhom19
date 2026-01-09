# Public Security Group (Bastion Host)
resource "aws_security_group" "public_sg" {
  name        = "public-sg"
  description = "Allow SSH from my IP"
  vpc_id      = var.vpc_id

  # Ingress: Cho phép SSH (port 22) từ IP của bạn
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [format("%s%s", var.my_public_ip, can(regex("/", var.my_public_ip)) ? "" : "/32")]
  }

  # Egress: Cho phép server truy cập ra ngoài 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 = all protocol
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "public-sg" }
}

# Private Security Group (App Server)
resource "aws_security_group" "private_sg" {
  name        = "private-sg"
  description = "Allow SSH from Public Instance only"
  vpc_id      = var.vpc_id

  # Ingress: Chỉ cho phép từ Public Security Group
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.public_sg.id]
  }

  # Egress: Cho phép ra ngoài = NAT Gateway
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "private-sg" }
}