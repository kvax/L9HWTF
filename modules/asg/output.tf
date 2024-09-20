# ASG Output

output "instance_id" {
  description = "The ID of the created ASG instance"
  value       = aws_autoscaling_group.asg.id
}

