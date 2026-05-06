output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.main.id
}

output "instance_private_ip" {
  description = "Private IP of the EC2 instance"
  value       = aws_instance.main.private_ip
}

output "security_group_id" {
  description = "Security group ID attached to the EC2 instance"
  value       = aws_security_group.ec2.id
}
