variable "aws_region" {
  description = "Região da AWS para o deploy"
  type        = string
  default     = "us-east-1"
}

variable "app_name" {
  description = "Nome usado em todos os recursos"
  type        = string
  default     = "rails-docker-aws"
}

variable "container_port" {
  description = "Porta em que o container Rails escuta"
  type        = number
  default     = 3000
}

variable "desired_count" {
  description = "Número de tasks Fargate a rodar"
  type        = number
  default     = 2
}

variable "image_tag" {
  description = "Tag da imagem do container para deploy"
  type        = string
  default     = "latest"
}

variable "rails_master_key" {
  description = "Master key das credentials do Rails (use SSM/Secrets Manager em produção real)"
  type        = string
  sensitive   = true
  default     = ""
}

variable "db_password" {
  description = "Senha do RDS PostgreSQL (use SSM/Secrets Manager em produção real)"
  type        = string
  sensitive   = true
  default     = "change-me-before-applying"
}
