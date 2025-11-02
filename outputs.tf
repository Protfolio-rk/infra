# Network Module Outputs

output "vpc_id" {
  value = module.network.vpc_id
}

output "vpc_cidr_block" {
  value = module.network.vpc_cidr_block
}

output "subnet_ids" {
  value = module.network.subnet_ids
}

output "subnet_cidrs" {
  value = module.network.subnet_cidrs
}

output "database_cluster_sg" {
  value = module.network.database_cluster_sg
}

output "database_client_sg" {
  value = module.network.database_client_sg
}

output "aws_services_gateway_sg_id" {
  value = module.network.aws_services_gateway_sg_id
}

output "api_gateway_vpclink_id" {
  value = module.network.api_gateway_vpclink_id
}

# Elastic Container Registry (ECR) Module Outputs

output "cms_repository_url" {
  value = module.ecr.ecr_cms_url
}

output "front_repository_url" {
  value = module.ecr.ecr_front_url
}

# ECS Fargate Module Outputs
output "ecs_lb_arn" {
  value = module.fargate.ecs_lb_arn
}

output "ecs_role_arn" {
  value = module.fargate.ecs_role_arn
}

output "ecs_cluster_id" {
  value = module.fargate.ecs_cluster_id
}