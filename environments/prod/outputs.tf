output "public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.docker_host.public_ip
}