# Terraform VPC Lab

## Overview
This lab provisions a production-grade AWS VPC using Terraform with remote state management. Built as part of platform engineering skill development targeting DoD cloud infrastructure roles.

## Architecture
- VPC with CIDR `10.0.0.0/16`
- Public subnet (`10.0.1.0/24`) in us-east-1a
- Private subnet (`10.0.2.0/24`) in us-east-1b
- Internet Gateway attached to VPC
- Remote state stored in S3 with DynamoDB state locking

## Tools Used
- Terraform v1.x
- AWS CLI
- AWS VPC, S3, DynamoDB

## Prerequisites
- AWS CLI configured with valid credentials
- Terraform installed
- S3 bucket for remote state
- DynamoDB table for state locking

## Usage

### 1. Update backend configuration
Edit the `backend "s3"` block in `main.tf` with your bucket name and DynamoDB table.

### 2. Initialize Terraform
```bash
terraform init
```

### 3. Plan and apply
```bash
terraform plan -out=tfplan
terraform apply tfplan
```

### 4. Destroy when done
```bash
terraform destroy
```

## Key Concepts Demonstrated
- Infrastructure as Code (IaC) with HCL
- Remote state management with S3 backend
- DynamoDB state locking for team safety
- Resource tagging for environment tracking
- Separation of variables, resources, and outputs

## Known Notes
- The `dynamodb_table` backend parameter shows a deprecation warning in AWS provider v5.100.0. Future versions will use `use_lockfile` instead. Functionality is unaffected.

## Screenshots
<!-- Add screenshots here after drag and drop into GitHub editor -->

## Author
Immanuel Thornton
