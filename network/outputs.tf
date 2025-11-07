output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr_block" {
  value = aws_vpc.main.cidr_block
}

output "subnet_cidrs" {
  value = [
    aws_subnet.p_1.cidr_block,
    aws_subnet.p_2.cidr_block
  ]
}

output "subnet_ids" {
  value = [
    aws_subnet.p_1.id,
    aws_subnet.p_2.id
  ]
}

# Database Security Group

output "database_client_sg" {
  value = aws_security_group.database_client_sg.id
}

output "database_cluster_sg" {
  value = aws_security_group.database_cluster_sg.id
}

# Endpoints Security Groups
output "aws_services_gateway_sg_id" {
  value = aws_security_group.aws_services_gateway_sg.id
}

output "api_gateway_vpclink_id" {
  value = aws_apigatewayv2_vpc_link.api_gw_vpc_link.id
}

# Load Balancer Security Group
output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}