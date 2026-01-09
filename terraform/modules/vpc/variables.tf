variable "vpc_cidr" {
  description = "Dai IP VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Dai IP Public Subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Dai IP Private Subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "az" {
  description = "Availability Zone de tao Subnet (Region)"
  type        = string
  default     = "us-east-1a"
}