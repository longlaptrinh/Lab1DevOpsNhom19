variable "public_subnet_id" { type = string }
variable "private_subnet_id" { type = string }
variable "public_sg_id" { type = string }
variable "private_sg_id" { type = string }

variable "ami_id" {
  description = "AMI ID cua he dieu hanh"
  type        = string
  # Tìm AMI ID trong AWS Console hoặc dùng Data Source để lấy tự động
  default = "ami-068c0051b15cdb816" # ID cua Amazon Linux 2023 trong us-east-1
}

variable "instance_type" {
  default = "t3.micro" 
}

variable "key_name" {
  description = "Ten key pair de SSH vao EC2"
  type        = string
}