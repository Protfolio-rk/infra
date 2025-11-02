resource "aws_ecs_cluster" "fargate" {
  name = "fargate-${var.project_name}"
  tags = {
    Name = "fargate-cluster"
  }
}

# IAM Role for ECS Tasks

resource "aws_iam_role" "ecs_role" {
  name = "${var.project_name}-ecs-task-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = [
            "ecs-tasks.amazonaws.com",
            "ecs.amazonaws.com"
          ]
        }
      }
    ]
  })

  tags = {
    Name = "${var.project_name}-ecs-role"
  }
}

resource "aws_iam_role_policy_attachment" "ecs_role_execution_role_policy" {
  role       = aws_iam_role.ecs_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# Load Balancer for Fargate Service

resource "aws_lb" "ecs_alb" {
  name               = "${var.project_name}-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [var.lb_sg_id]
  subnets            = var.lb_subnets_ids

  tags = {
    Name = "${var.project_name}-alb"
  }
}
