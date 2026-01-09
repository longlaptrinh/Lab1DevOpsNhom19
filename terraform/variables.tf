# project-root/variables.tf

variable "aws_region" {
  description = "AWS Region to deploy to"
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name prefix"
  default     = "lab1-devops-nhom19"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "my_ip" {
  description = "IP Address for SSH access"
  type        = string
  default = "104.28.237.73" #IP nhà mình
}

variable "key_pair_name" {
  description = "Name of the existing Key Pair on AWS"
  type        = string
  default = "keyec2nhom19"
}