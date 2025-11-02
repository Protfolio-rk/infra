# S3 Bucket
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [aws_route_table.main.id]

  policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Effect : "Allow",
        Principal : "*",
        Action : [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:AbortMultipartUpload",
          "s3:GetObjectAcl",
          "s3:GetBucketAcl",
          "s3:ListBucket",
          "s3:GetBucketLocation"
        ],
        Resource : "*"
      }
    ]
  })

  tags = {
    Name = "${var.project_name}-s3-endpoint"
  }
}

# Docker Registry
resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${var.region}.ecr.dkr"
  vpc_endpoint_type = "Interface"

  subnet_ids         = [aws_subnet.p_1.id, aws_subnet.p_2.id]
  security_group_ids = [aws_security_group.aws_services_gateway_sg.id]

  private_dns_enabled = true

  tags = {
    Name = "${var.project_name}-ecr-dkr-endpoint"
  }
}

resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${var.region}.ecr.api"
  vpc_endpoint_type = "Interface"

  subnet_ids         = [aws_subnet.p_1.id, aws_subnet.p_2.id]
  security_group_ids = [aws_security_group.aws_services_gateway_sg.id]

  private_dns_enabled = true

  tags = {
    Name = "${var.project_name}-ecr-api-endpoint"
  }
}

# Cloudwatch Logs
resource "aws_vpc_endpoint" "logs" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${var.region}.logs"
  vpc_endpoint_type = "Interface"

  subnet_ids         = [aws_subnet.p_1.id, aws_subnet.p_2.id]
  security_group_ids = [aws_security_group.aws_services_gateway_sg.id]

  private_dns_enabled = true

  tags = {
    Name = "${var.project_name}-logs-endpoint"
  }
}

# Api Gateway
resource "aws_vpc_endpoint" "apigateway" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${var.region}.execute-api"
  vpc_endpoint_type = "Interface"

  subnet_ids         = [aws_subnet.p_1.id, aws_subnet.p_2.id]
  security_group_ids = [aws_security_group.alb_sg.id]

  private_dns_enabled = true
  tags = {
    Name = "${var.project_name}-apigateway-endpoint"
  }
}

resource "aws_apigatewayv2_vpc_link" "api_gw_vpc_link" {
  name        = "${var.project_name}-apigw-vpc-link"
  subnet_ids  = [aws_subnet.p_1.id, aws_subnet.p_2.id]
  security_group_ids = [aws_security_group.alb_sg.id]

  tags = {
    Name = "${var.project_name}-apigw-vpc-link"
  }
}