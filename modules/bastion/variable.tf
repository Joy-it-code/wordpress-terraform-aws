variable "vpc_id" {
  description = "The ID of the VPC where resources are deployed."
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs."
  type        = list(string)
}

variable "ami_id" {
  description = "AMI ID to use for the EC2 instance."
}

variable "ec2_key_name" {
  description = "The EC2 key pair name to use for SSH access."
}

variable "bastion_instance_type" {
  description = "EC2 instance type for the Bastion host"
  type        = string
}
