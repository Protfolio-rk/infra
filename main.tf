module "network" {
  source = "./network"

  region       = var.aws_region
  project_name = var.project_name
}

module "ecr" {
  source = "./ecr"
}

module "fargate" {
  source = "./fargate"

  project_name     = var.project_name
  lb_subnets_ids = module.network.subnet_ids
  lb_sg_id         = module.network.alb_sg_id
}
