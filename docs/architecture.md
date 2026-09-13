\# Architecture Documentation



\## Overview



This project defines an AWS cloud infrastructure architecture using Terraform.



The current implementation focuses on Infrastructure as Code, networking, compute, security configuration, and load balancing.



The Terraform configuration has been locally initialized, formatted, and validated successfully.



Real AWS provisioning has not yet been performed.



\---



\## Architecture Diagram



```text

&#x20;                      Internet

&#x20;                         |

&#x20;                         v

&#x20;                 Internet Gateway

&#x20;                         |

&#x20;                         v

&#x20;                 Public Route Table

&#x20;                    /          \\

&#x20;                   /            \\

&#x20;                  v              v

&#x20;         Public Subnet 1   Public Subnet 2

&#x20;            AZ #1             AZ #2

&#x20;                  \\            /

&#x20;                   \\          /

&#x20;                    v        v

&#x20;              Application Load Balancer

&#x20;                         |

&#x20;                         v

&#x20;                    Target Group

&#x20;                         |

&#x20;                         v

&#x20;                     EC2 Instance

&#x20;                         |

&#x20;                         v

&#x20;                       Nginx

```



\---



\## Network Design



\### VPC



The infrastructure uses a dedicated VPC:



```text

10.0.0.0/16

```



This VPC provides the network boundary for all resources in the project.



\---



\## Public Subnets



Two public subnets are defined:



```text

10.0.1.0/24

10.0.2.0/24

```



Each subnet is placed in a different Availability Zone.



Using multiple Availability Zones allows the Application Load Balancer to use a valid multi-AZ architecture.



\---



\## Internet Gateway



An Internet Gateway is attached to the VPC.



The Internet Gateway provides connectivity between public AWS resources and the internet.



\---



\## Route Table



A public route table is configured with the following route:



```text

0.0.0.0/0 -> Internet Gateway

```



Both public subnets are associated with this route table.



\---



\## Security Group



The web Security Group currently allows:



```text

TCP 80 - HTTP

TCP 22 - SSH

```



Current source:



```text

0.0.0.0/0

```



HTTP access is intentionally public.



SSH access should be restricted to a trusted IP address before any real deployment.



Outbound traffic is currently allowed.



\---



\## Compute Layer



The project defines an Amazon EC2 instance.



Configuration:



```text

Operating System: Amazon Linux 2023

Instance Type: t3.micro

```



The EC2 instance is deployed in the first public subnet.



Terraform user data is used to automatically:



\- Install Nginx

\- Enable the Nginx service

\- Start Nginx

\- Create a basic HTML page



\---



\## Load Balancer



The project defines an AWS Application Load Balancer.



The Load Balancer:



\- Uses both public subnets

\- Spans two Availability Zones

\- Accepts HTTP traffic on port 80

\- Forwards traffic to a Target Group

\- Routes traffic to the EC2 instance



\---



\## Traffic Flow



```text

Internet

&#x20;  |

&#x20;  v

Application Load Balancer

&#x20;  |

&#x20;  v

HTTP Listener

&#x20;  |

&#x20;  v

Target Group

&#x20;  |

&#x20;  v

EC2 Instance

&#x20;  |

&#x20;  v

Nginx

```



\---



\## Terraform Structure



Main Terraform files:



```text

main.tf

variables.tf

outputs.tf

providers.tf

versions.tf

```



Responsibilities:



\- `main.tf` - AWS infrastructure resources

\- `variables.tf` - configurable project variables

\- `outputs.tf` - infrastructure outputs

\- `providers.tf` - AWS provider configuration

\- `versions.tf` - Terraform and provider version requirements



\---



\## Current Validation Status



The following commands have been successfully executed:



```bash

terraform init

terraform fmt

terraform validate

```



Validation result:



```text

Success! The configuration is valid.

```



\---



\## Deployment Status



The current architecture exists as validated Terraform configuration.



The following steps have not yet been performed:



```text

terraform plan against a real AWS account

terraform apply

AWS resource validation

Application Load Balancer health validation

EC2 connectivity validation

terraform destroy

Cloud cleanup verification

```



No claim is made that these resources currently exist in a live AWS environment.



\---



\## Security Considerations



Before real deployment:



\- Restrict SSH access

\- Protect AWS credentials

\- Never commit Terraform state files

\- Never commit private keys

\- Review Security Group rules

\- Review AWS billing

\- Configure AWS budget alerts

\- Destroy unnecessary resources after testing



\---



\## Future Architecture Improvements



Possible future improvements include:



\- Private subnets

\- NAT Gateway

\- Auto Scaling Group

\- HTTPS

\- AWS Certificate Manager

\- Separate Load Balancer and EC2 Security Groups

\- Remote Terraform state

\- Terraform modules

\- CI validation with GitHub Actions



These improvements are not part of the currently validated implementation unless added and verified later.

