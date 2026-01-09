# Public Instance (Bastion Host)
resource "aws_instance" "public_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id

  # Gán Security Group
  vpc_security_group_ids = [var.public_sg_id]

  # Cần Key Pair để SSH vào Instance!
  key_name = var.key_name

  tags = { Name = "Public-JumpServer" }
}

# Private Instance (App Server)
resource "aws_instance" "private_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_id

  # Gán Security Group
  vpc_security_group_ids = [var.private_sg_id]

  key_name = var.key_name

  tags = { Name = "Private-DatabaseServer" }
}