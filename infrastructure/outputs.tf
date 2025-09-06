output "cluster_name" {
  description = "The ECS cluster's name"
  value       = aws_ecs_cluster.main.name
}

output "service-name" {
  description = "The ECS service name."
  value       = aws_ecs_service.main.name
}

output "lb-dns" {
  value = aws_alb.main.dns_name
}