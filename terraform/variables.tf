variable "aws_region" {
  description = "AWS region for infrastructure deployment"
  type        = string
  default     = "eu-central-1"
}

variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
  default     = "terraform-cloud-infrastructure"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}