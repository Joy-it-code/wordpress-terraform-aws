output "alb_dns_name" {
  value = aws_lb.wordpress_alb.dns_name
}

output "alb_arn" {
  description = "The ARN of the ALB"
  value       = aws_lb.wordpress_alb.arn
}

output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "alb_target_group_arn" {
  value = aws_lb_target_group.wordpress_tg.arn
}
