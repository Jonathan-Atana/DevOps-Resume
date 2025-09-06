# IAM Role for ECS
resource "aws_iam_role" "ecs_task_execution" {
  name               = "ecsTaskExecutionRole"
  description        = "Role for ECS tasks to execute and pull images from ECR"
  assume_role_policy = data.aws_iam_policy_document.ecs_task_assume_role_policy.json

  tags = {
    Service     = "ECS"
    env = var.env
  }
}

data "aws_iam_policy_document" "ecs_task_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_policy" {
  role       = aws_iam_role.ecs_task_execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
