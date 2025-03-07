provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "docker_host" {
  ami           = "ami-04b70fa74e45c3917"  
  instance_type = var.instance_type
  key_name      = "docker"

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo amazon-linux-extras install docker -y
    sudo service docker start
    sudo usermod -a -G docker ec2-user

    # Install AWS CLI v2
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install

    # Authenticate Docker to ECR
    $(aws ecr get-login-password --region ${var.aws_region}) | docker login --username AWS --password-stdin ${var.ecr_repository_url}

    # Pull and run the Docker image from ECR
    docker run -d -p 80:80 ${var.ecr_repository_url}:${var.docker_image_tag}
  EOF

  tags = {
    Name = "docker-host"
  }
}

output "instance_public_ip" {
  value = aws_instance.docker_host.public_ip
}
