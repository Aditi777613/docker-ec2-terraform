#!/bin/bash

# Variables
AWS_REGION="us-east-1"
ECR_REGISTRY_ID="975049883799"
ECR_REPOSITORY_NAME="nodejs-app"
ECR_IMAGE_TAG="latest"

# Update the package repository
sudo apt-get update -y

# Install Docker
sudo apt-get install -y docker.io

# Start Docker service
sudo systemctl start docker

# Enable Docker service to start on boot
sudo systemctl enable docker

# Add the ubuntu user to the docker group so you can execute Docker commands without using sudo
sudo usermod -aG docker ubuntu

# Install AWS CLI
sudo apt-get install -y awscli

# Authenticate Docker to the ECR registry
aws ecr get-login-password --region $AWS_REGION | sudo docker login --username AWS --password-stdin $ECR_REGISTRY_ID.dkr.ecr.$AWS_REGION.amazonaws.com

# Pull the Docker image from ECR
sudo docker pull $ECR_REGISTRY_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPOSITORY_NAME:$ECR_IMAGE_TAG

# Run the Docker container
sudo docker run -d -p 80:80 $ECR_REGISTRY_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPOSITORY_NAME:$ECR_IMAGE_TAG

# Verify Docker is running and the container is up (optional)
sudo docker ps -a
