variable "project_name" {
  description = "Name of the project"
  type = string  
}

variable "aws_region" {
  description = "Region where AWS resources will be created"
  default = "us-east-1"
  type = string
}