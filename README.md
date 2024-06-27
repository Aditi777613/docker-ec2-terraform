# Deploy Docker Image on EC2 Using Terraform

This project provides a complete solution for deploying a Docker image on an Amazon EC2 instance using Terraform. It automates the creation and configuration of AWS resources and ensures the Docker container is running on the EC2 instance.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://aws.amazon.com/cli/)
- [Docker](https://www.docker.com/get-started)
- An AWS account with appropriate permissions

## Project Structure

```plaintext
.
├── main.tf
├── variables.tf
├── outputs.tf
├── ec2_init_script.sh
├── README.md
└── .gitignore
```

- `main.tf`: Contains the main Terraform configuration.
- `variables.tf`: Defines the variables used in the Terraform configuration.
- `outputs.tf`: Specifies the outputs of the Terraform configuration.
- `ec2_init_script.sh`: Initialization script to install Docker and run the Docker container on the EC2 instance.
- `README.md`: This file.
- `.gitignore`: Specifies files to be ignored by Git.

## Usage

1. **Clone the Repository**

   ```bash
   git clone https://github.com/yourusername/deploy-docker-image-on-ec2-using-terraform.git
   cd deploy-docker-image-on-ec2-using-terraform
   ```

2. **Configure AWS CLI**

   Configure your AWS CLI with your credentials:

   ```bash
   aws configure
   ```

3. **Initialize Terraform**

   Initialize the Terraform working directory:

   ```bash
   terraform init
   ```

4. **Plan the Deployment**

   Review the execution plan for your Terraform configuration:

   ```bash
   terraform plan
   ```

5. **Apply the Configuration**

   Apply the Terraform configuration to create the resources:

   ```bash
   terraform apply
   ```

6. **Access the EC2 Instance**

   Once the apply step is complete, you can access your EC2 instance using the output public IP
   
## Cleanup

To clean up the resources created by Terraform, run:

```bash
terraform destroy
```

This command will destroy all the resources created by this project.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss your changes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
