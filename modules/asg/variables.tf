variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
}

variable "instance_type" {
  default     = "t3.micro"
  description = "EC2 instance type"
}

variable "key_pair_name" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "target_group_arn" {
  type = string
}

variable "min_size" {
  default = 1
}

variable "max_size" {
  default = 3
}

variable "desired_capacity" {
  default = 1
}

variable "efs_dns_name" {
  description = "DNS name of the EFS file system"
  type        = string
}
