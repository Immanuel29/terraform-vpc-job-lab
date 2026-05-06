variable "project_name" {
  description = "Name prefix for all resources"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "vpc_id" {
  description = "VPC ID to launch the instance in"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to launch the instance in"
  type        = string
}
