variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "app_name" {
  description = "Name used for all resources"
  type        = string
  default     = "rails-docker-aws"
}

variable "container_port" {
  description = "Port the Rails container listens on"
  type        = number
  default     = 3000
}

variable "desired_count" {
  description = "Number of Fargate tasks to run"
  type        = number
  default     = 2
}

variable "image_tag" {
  description = "Container image tag to deploy"
  type        = string
  default     = "latest"
}

variable "rails_master_key" {
  description = "Rails credentials master key (use SSM/Secrets Manager in real prod)"
  type        = string
  sensitive   = true
  default     = ""
}

variable "db_password" {
  description = "RDS PostgreSQL password (use SSM/Secrets Manager in real prod)"
  type        = string
  sensitive   = true
  default     = "change-me-before-applying"
}
