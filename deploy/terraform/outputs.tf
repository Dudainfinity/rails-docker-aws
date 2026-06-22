output "alb_dns_name" {
  description = "Nome DNS público do load balancer"
  value       = aws_lb.app.dns_name
}

output "ecr_repository_url" {
  description = "Repositório ECR para onde enviar a imagem"
  value       = aws_ecr_repository.app.repository_url
}

output "ecs_cluster" {
  description = "Nome do cluster ECS"
  value       = aws_ecs_cluster.app.name
}
