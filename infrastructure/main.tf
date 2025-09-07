# ECS Cluster
resource "aws_ecs_cluster" "main" {
  name = "${var.container_name}-cluster"
}

# Task Definition
resource "aws_ecs_task_definition" "main" {
  family                   = "${var.container_name}-cluster-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn

  container_definitions = jsonencode([{
    name      = var.container_name
    image     = var.container_image
    essential = true
    portMappings = [{
      containerPort = 80
      hostPort      = 80
    }]
  }])
}

# ECS Service
resource "aws_ecs_service" "main" {
  name            = "${var.container_name}-cluster-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.main.arn
  desired_count   = 2
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [aws_security_group.ecs_service.id]
    subnets          = module.vpc.private_subnets
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.main.arn
    container_name   = var.container_name
    container_port   = 80
  }

  depends_on = [aws_alb_listener.main]
}

# Create the s3 bucket
resource "aws_s3_bucket" "this" {
  bucket        = var.bucket_name
  force_destroy = true
}