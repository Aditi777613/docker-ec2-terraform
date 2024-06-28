variable "aws_region" {
  description = "The AWS region to deploy to"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "docker_ssh_key" {
  description = "SSH key pair name"
  type        = string
}

variable "ecr_repository" {
  description = "ECR repository name"
  type        = string
}

variable "ecr_repository_url" {
  description = "ECR repository URL"
  type        = string
  default     = ""  
}

variable "docker_image_tag" {
  description = "Docker image tag to deploy"
  default     = "latest"  
}