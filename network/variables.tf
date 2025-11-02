variable "project_name" {
  type = string
}

variable "region" {
  type        = string
  description = "The AWS region to deploy resources in"
}

variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

