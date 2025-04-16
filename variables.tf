variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "db_name" {
  description = "Database name for RDS"
  type        = string
}

variable "db_user" {
  description = "Database master username"
  type        = string
}

variable "db_pass" {
  description = "Database master password"
  type        = string
  sensitive   = true
}

variable "ec2_key_name" {
  description = "The key name to use for the EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for the ec2"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "wordpress_instance_type" {
  description = "Instance type for WordPress application"
  type        = string
  default     = "t3.micro"
}

variable "bastion_instance_type" {
  description = "Instance type for Bastion host"
  type        = string
  default     = "t2.micro"
}
