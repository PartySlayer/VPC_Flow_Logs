output "instance_id" {
  description = "EC2 instance id"
  value       = aws_instance.ec2.id
}