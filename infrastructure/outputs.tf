output "cluster_name" {
  description = "The ECS cluster's name"
  value       = aws_ecs_cluster.main.name
}

output "service-name" {
  description = "The ECS service name."
  value       = aws_ecs_service.main.name
}

output "task-definition" {
  description = "The task family name"
  value       = aws_ecs_task_definition.main.family
}

output "container-name" {
  description = "Name of the container"
  value       = var.container_name
}

output "lb-dns" {
  value = aws_alb.main.dns_name
}