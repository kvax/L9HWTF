# L9HWTF
Lesson9HW AWS Infrastructure with Terraform

This Terraform project provisions a complete AWS infrastructure with networking, compute resources, and database management. It uses reusable modules for VPC, Application Load Balancer (ALB), Auto Scaling Group (ASG), and RDS, along with remote state management via S3 and DynamoDB.

## Architecture Diagram
The infrastructure consists of the following components:

* **VPC**: A Virtual Private Cloud with public and private subnets across two Availability Zones (AZs).
* **ALB**: An Application Load Balancer deployed in the public subnets, serving web traffic.
* **ASG**: An Auto Scaling Group managing EC2 instances across private subnets, configured for high availability and scaling based on CPU utilization.
* **RDS**: A MySQL database using AWS RDS in a Multi-AZ setup, ensuring high availability and data redundancy.
* **Security**: Security Groups for ALB, EC2, and RDS, restricting access based on best practices.