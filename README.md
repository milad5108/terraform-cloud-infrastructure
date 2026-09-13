# Terraform Cloud Infrastructure

A portfolio-focused Infrastructure as Code project built with Terraform and AWS.

This project demonstrates how cloud infrastructure can be defined, structured, validated, and version-controlled using Terraform.

> Note: The current project has been locally initialized and validated with Terraform. Real AWS provisioning has not yet been performed because an active AWS account with billing access is not currently available.

---

## Project Goals

The main goals of this project are to demonstrate practical skills in:

- Terraform
- Infrastructure as Code
- AWS cloud infrastructure design
- VPC networking
- Public subnets
- Security groups
- EC2 compute
- Application Load Balancer
- Terraform variables and outputs
- Infrastructure validation
- Git and GitHub workflow

---

## Architecture

```text
Internet
   |
   v
Internet Gateway
   |
   v
Public Route Table
   |
   +------------------+
   |                  |
   v                  v
Public Subnet 1   Public Subnet 2
AZ #1             AZ #2
   \                  /
    \                /
     v              v
 Application Load Balancer
            |
            v
       Target Group
            |
            v
          EC2
            |
            v
          Nginx
```

---

## Infrastructure Components

The Terraform configuration currently includes:

- AWS VPC
- Two Public Subnets
- Two Availability Zones
- Internet Gateway
- Public Route Table
- Route Table Associations
- Web Security Group
- Amazon Linux 2023 AMI lookup
- EC2 Instance
- Nginx installation using user data
- Application Load Balancer
- Target Group
- Target Group Attachment
- HTTP Listener
- Terraform Variables
- Terraform Outputs

---

## Project Structure

```text
terraform-cloud-infrastructure/
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── providers.tf
│   ├── versions.tf
│   └── .terraform.lock.hcl
├── docs/
├── screenshots/
├── .gitignore
└── README.md
```

---

## AWS Region

Default region:

```text
eu-central-1
```

The Frankfurt AWS region is used as the default region.

---

## Networking

VPC CIDR:

```text
10.0.0.0/16
```

Public subnets:

```text
10.0.1.0/24
10.0.2.0/24
```

The two public subnets are configured in separate Availability Zones.

---

## Security

Inbound ports currently configured:

```text
80 - HTTP
22 - SSH
```

HTTP access is currently allowed from:

```text
0.0.0.0/0
```

SSH is also currently configured as:

```text
0.0.0.0/0
```

This SSH rule should be restricted to a trusted IP address before any real deployment.

Terraform state files, variable files, private keys, environment files, and other sensitive files are excluded through `.gitignore`.

No AWS credentials are stored in this repository.

---

## Compute

The project defines an EC2 instance using Amazon Linux 2023.

Instance type:

```text
t3.micro
```

Terraform user data automatically:

1. Installs Nginx
2. Enables Nginx
3. Starts Nginx
4. Creates a simple HTML test page

---

## Load Balancing

The architecture includes an AWS Application Load Balancer.

Traffic flow:

```text
Internet
   |
   v
Application Load Balancer
   |
   v
Target Group
   |
   v
EC2 Instance
```

The listener accepts HTTP traffic on port 80.

---

## Terraform Variables

Current variables:

- AWS region
- Project name
- Environment

Default values:

```hcl
aws_region   = "eu-central-1"
project_name = "terraform-cloud-infrastructure"
environment  = "dev"
```

---

## Terraform Outputs

The project currently defines outputs for:

- VPC ID
- Public Subnet 1 ID
- Public Subnet 2 ID
- Security Group ID
- EC2 Instance ID
- EC2 Public IP
- Load Balancer DNS name
- Target Group ARN

---

## Validation

The following Terraform commands have been successfully completed:

```bash
terraform init
terraform fmt
terraform validate
```

Validation result:

```text
Success! The configuration is valid.
```

---

## Deployment Status

```text
Terraform configuration: COMPLETE
Terraform initialization: COMPLETE
Terraform formatting: COMPLETE
Terraform validation: COMPLETE

AWS real deployment: NOT YET PERFORMED
terraform apply: NOT YET PERFORMED
Cloud resource validation: NOT YET PERFORMED
terraform destroy validation: NOT YET PERFORMED
```

The project does not claim that the infrastructure has been deployed to a real AWS environment.

---

## Cost Awareness

Some AWS resources used by this project may generate charges when deployed.

Before real deployment:

- Review AWS pricing
- Configure billing alerts
- Avoid leaving unnecessary resources running
- Validate resources after deployment
- Run `terraform destroy` after testing when appropriate

---

## Terraform Workflow

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

Cleanup:

```bash
terraform destroy
```

At the current stage, only the non-billable local validation workflow has been completed.

---

## Future Improvements

Planned improvements:

- Real AWS deployment
- Cloud-side validation
- Restrict SSH access
- HTTPS listener
- ACM certificate integration
- Improved security group separation
- Remote Terraform state
- Terraform modules
- CI validation workflow
- Architecture screenshots
- Deployment evidence
- Destroy and cleanup validation

---

## Portfolio Status

This project is part of a DevOps portfolio focused on practical and verifiable skills.

All documented capabilities are intended to match the actual implementation state of the project.