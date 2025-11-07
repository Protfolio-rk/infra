variable "project_name" {
  description = "Name of the project"
  type = string  
}

variable "aws_region" {
  description = "Region where AWS resources will be created"
  default = "us-east-1"
  type = string
}

variable "backend_bucket_name" {
  description = "S3 bucket name for Terraform backend"
  type = string
}