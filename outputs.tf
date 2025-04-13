output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "The public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnets" {
  description = "The private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

output "wordpress_sg_id" {
  value = module.wordpress.wordpress_sg_id
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "alb_target_group_arn" {
  value = module.alb.alb_target_group_arn
}
