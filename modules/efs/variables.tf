variable "private_subnet_ids" {
  description = "The list of private subnet IDs."
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID where resources will be created."
  type        = string
}

variable "ec2_sg_id" {
  description = "The EC2 security group ID."
  type        = string
}
