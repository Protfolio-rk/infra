output "ecs_cluster_id" {
  value = aws_ecs_cluster.fargate.id
}

output "ecs_role_arn" {
  value = aws_iam_role.ecs_role.arn
}

output "ecs_lb_arn" {
  value = aws_lb.ecs_alb.arn
}

output "ecs_lb_dns_name" {
  value = aws_lb.ecs_alb.dns_name
}