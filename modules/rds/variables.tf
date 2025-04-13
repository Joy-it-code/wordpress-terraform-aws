variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "ec2_sg_id" {
  description = "Security group ID for EC2 to allow MySQL access"
  type = string
  default     = null
}

variable "db_name" {
  type = string
}

variable "db_user" {
  type = string
}

variable "db_pass" {
  type = string
  sensitive = true
}