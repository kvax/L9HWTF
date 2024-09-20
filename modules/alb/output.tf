# ALB Output

output "alb_id" {
  description = "The ID of the created ALB instance"
  value       = aws_lb.alb.id
}

output "alb_dns" {
  description = "DNS name of the load balancer"
  value       = aws_lb.alb.dns_name
}