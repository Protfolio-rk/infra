resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_subnet" "p_1" {
  vpc_id = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 4, 2)
  availability_zone = "us-east-1a"

  tags = {
    Name = "${var.project_name}-subnet-1"
  }
}

resource "aws_subnet" "p_2" {
  vpc_id = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 4, 3)
  availability_zone = "us-east-1b"

  tags = {
    Name = "${var.project_name}-subnet-2"
  }
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-route-table"
  }
}

resource "aws_route_table_association" "a_1" {
  subnet_id      = aws_subnet.p_1.id
  route_table_id = aws_route_table.main.id
}
resource "aws_route_table_association" "a_2" {
  subnet_id      = aws_subnet.p_2.id
  route_table_id = aws_route_table.main.id
}