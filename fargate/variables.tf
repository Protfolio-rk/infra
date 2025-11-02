variable "project_name" {
  type = string
}

variable "lb_subnets_ids" {
  type = list(string)
}

variable "lb_sg_id" {
  type = string
}