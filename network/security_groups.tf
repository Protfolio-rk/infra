# ┌─────────────┐
# │  DATABASE   │
# └─────────────┘
resource "aws_security_group" "database_client_sg" {
  name        = "${var.project_name}-db-client-sg"
  description = "Security group for database clients"
  vpc_id      = aws_vpc.main.id

  egress {
    from_port = 27017
    to_port   = 27017
    protocol  = "tcp"
    cidr_blocks = [
      aws_subnet.p_1.cidr_block,
      aws_subnet.p_2.cidr_block
    ]
  }

  egress {
    from_port   = 53
    to_port     = 53
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  egress {
    from_port   = 53
    to_port     = 53
    protocol    = "udp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  tags = {
    Name        = "${var.project_name}-db-client-sg"
    Description = "Security group to connect to database servers"
    Usage       = "Database clients"
  }
}

resource "aws_security_group" "database_cluster_sg" {
  name        = "${var.project_name}-db-cluster-sg"
  description = "Security group for database servers"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 27017
    to_port         = 27017
    protocol        = "tcp"
    security_groups = [aws_security_group.database_client_sg.id]
  }

  tags = {
    Name        = "${var.project_name}-db-cluster-sg"
    Description = "Security group to listen to database connections"
    Usage       = "Database cluster"
  }
}

# ┌─────────────────────┐
# │    ENDPOINTS SGs    │
# └─────────────────────┘
resource "aws_security_group" "aws_services_gateway_sg" {
  name        = "${var.project_name}-aws-services-gateway-sg"
  description = "Security group for AWS services gateway endpoints"
  vpc_id      = aws_vpc.main.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }
  
  tags = {
    Name        = "${var.project_name}-aws-services-gateway-sg"
    Description = "Security group to access AWS services gateway endpoints"
    Usage       = "Clients accessing AWS services gateway endpoints"
  }
}

# ┌─────────────┐
# │   LOAD BAL  │
# └─────────────┘
resource "aws_security_group" "alb_sg" {
  name        = "${var.project_name}-alb-sg"
  description = "Security group for Application Load Balancer"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port = 81
    to_port   = 81
    protocol  = "tcp"
    cidr_blocks = [
      aws_subnet.p_1.cidr_block,
      aws_subnet.p_2.cidr_block
    ]
    description = "Allow HTTPS from API Gateway endpoint subnets"
  }

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = [
      aws_subnet.p_1.cidr_block,
      aws_subnet.p_2.cidr_block
    ]
    description = "Allow HTTP from API Gateway endpoint subnets"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  tags = {
    Name        = "${var.project_name}-alb-sg"
    Description = "Security group for Application Load Balancer"
    Usage       = "Load Balancer"
  }
}
