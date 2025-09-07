output "cluster_name" {
  description = "The ECS cluster's name"
  value       = aws_ecs_cluster.main.name
}

output "service-name" {
  description = "The ECS service name."
  value       = aws_ecs_service.main.name
}

output "container-image" {
  description = "Image uri"
  value = var.container_image
}

output "container-name" {
  description = "Image uri"
  value = var.container_name
}

output "lb-dns" {
  value = aws_alb.main.dns_name
}