# Lesson9HW AWS Infrastructure with Terraform

This Terraform project provisions a complete AWS infrastructure with networking, compute resources, and database management. It uses reusable modules for VPC, Application Load Balancer (ALB), Auto Scaling Group (ASG), and RDS, along with remote state management via S3 and DynamoDB.

## Architecture

The infrastructure consists of the following components:

- **VPC**: A Virtual Private Cloud with public and private subnets across two Availability Zones (AZs).
- **ALB**: An Application Load Balancer deployed in the public subnets, serving web traffic.
- **ASG**: An Auto Scaling Group managing EC2 instances across private subnets, configured for high availability and scaling based on CPU utilization.
- **RDS**: A MySQL database using AWS RDS in a Multi-AZ setup, ensuring high availability and data redundancy.
- **Security**: Security Groups for ALB, EC2, and RDS, restricting access based on best practices.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Variables](#variables)
- [How to Deploy](#how-to-deploy)
- [Cleanup Instructions](#cleanup-instructions)

## Prerequisites

Ensure you have the following installed and configured:

- **Terraform v1.0+**: [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- **AWS CLI**: [Install AWS CLI](https://aws.amazon.com/cli/) and configure it with your credentials (`aws configure`)
- **IAM Permissions**: The IAM user/role running Terraform must have appropriate permissions to create and manage the following resources:
  - VPC, Subnets, Internet Gateway, NAT Gateway
  - EC2 Instances, Security Groups, IAM roles and policies
  - RDS (MySQL), DynamoDB, and S3

## Variables

Configure the following variables to customize your infrastructure:

| Variable                 | Description                                  | Default Value             |
|--------------------------|----------------------------------------------|---------------------------|
| `vpc_cidr`                | CIDR block for the VPC                       | `10.0.0.0/16`             |
| `public_subnet_cidrs`     | List of public subnet CIDRs                  | `["10.0.1.0/24", "10.0.2.0/24"]` |
| `private_subnet_cidrs`    | List of private subnet CIDRs                 | `["10.0.3.0/24", "10.0.4.0/24"]` |
| `azs`                     | List of Availability Zones                  | `["us-east-1a", "us-east-1b"]`   |
| `desired_capacity`        | Desired capacity for the Auto Scaling Group  | `2`                         |
| `max_size`                | Maximum capacity for the Auto Scaling Group  | `4`                         |
| `min_size`                | Minimum capacity for the Auto Scaling Group  | `1`                         |
| `instance_type`           | EC2 instance type for ASG                    | `t3.micro`                 |
| `db_password`             | Password for RDS MySQL database              | `your-password`            |
| `certificate_arn`         | ARN of SSL Certificate for HTTPS ALB         | N/A *(Optional)*           |

## How to Deploy

### Step 1: Initialize Terraform

Run the following command to initialize the Terraform working directory and download the necessary providers and modules:

```bash
terraform init
```

### Step 2: Review the Plan

Before applying the changes, you can review what Terraform plans to create by running:

```bash
terraform plan
```

### Step 3: Apply the Changes

To provision the infrastructure on AWS, run the following command.
You will be prompted to confirm the action. Type yes to proceed.

```bash
terraform apply
```

## Cleanup Instructions

To cleanly remove all the resources created by this Terraform configuration, use the following command.
Review the plan to ensure you're only removing the resources you want to delete.
Confirm with yes when prompted.

```bash
terraform destroy
```

Additional Manual Steps:
 - Make sure any resources manually created (e.g., S3 buckets not managed by Terraform, SSL certificates) are also deleted to avoid ongoing charges.
 - S3 versioning is enabled, you'll need to manually clean up old versions of objects to avoid storage costs.
 - Automatic backups for RDS, ensure snapshots are deleted, as they incur storage charges.