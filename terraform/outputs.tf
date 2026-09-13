output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID of the first public subnet"
  value       = aws_subnet.public.id
}

output "public_subnet_2_id" {
  description = "ID of the second public subnet"
  value       = aws_subnet.public_2.id
}

output "security_group_id" {
  description = "ID of the web security group"
  value       = aws_security_group.web.id
}

output "ec2_instance_id" {
  description = "ID of the web EC2 instance"
  value       = aws_instance.web.id
}

output "ec2_public_ip" {
  description = "Public IP address of the web EC2 instance"
  value       = aws_instance.web.public_ip
}

output "load_balancer_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.web.dns_name
}

output "target_group_arn" {
  description = "ARN of the Application Load Balancer target group"
  value       = aws_lb_target_group.web.arn
}