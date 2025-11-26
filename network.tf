# VPC
resource "aws_vpc" "base" {
  cidr_block           = var.vpc_info.cidr
  enable_dns_hostnames = var.vpc_info.enable_dns_hostnames
  tags                 = var.vpc_info.tags
}

# Internet Gateway
resource "aws_internet_gateway" "base" {
  vpc_id = aws_vpc.base.id

  tags = {
    Name = "main-igw"
  }

  depends_on = [aws_vpc.base]
}

# Subnets
resource "aws_subnet" "web" {
  vpc_id            = aws_vpc.base.id
  availability_zone = var.web_subnet_info.az
  cidr_block        = var.web_subnet_info.cidr
  tags              = var.web_subnet_info.tags

  depends_on = [aws_vpc.base]
}

resource "aws_subnet" "app" {
  vpc_id            = aws_vpc.base.id
  availability_zone = var.app_subnet_info.az
  cidr_block        = var.app_subnet_info.cidr
  tags              = var.app_subnet_info.tags

  depends_on = [aws_vpc.base]
}

resource "aws_subnet" "db" {
  vpc_id            = aws_vpc.base.id
  availability_zone = var.db_subnet_info.az
  cidr_block        = var.db_subnet_info.cidr
  tags              = var.db_subnet_info.tags

  depends_on = [aws_vpc.base]
}

# Route Tables
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.base.id

  tags = {
    Name = "public"
    Env  = "Dev"
  }

  depends_on = [aws_subnet.web, aws_subnet.app]
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.base.id

  tags = {
    Name = "private"
    Env  = "Dev"
  }

  depends_on = [aws_internet_gateway.base, aws_subnet.db, aws_subnet.app]
}

# Routes
resource "aws_route" "internet" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.base.id
  route_table_id         = aws_route_table.public.id

  depends_on = [aws_internet_gateway.base, aws_route_table.public]
}

# Route Table Associations
resource "aws_route_table_association" "public" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.web.id
}

resource "aws_route_table_association" "private_app" {
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.app.id
}

resource "aws_route_table_association" "private_db" {
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.db.id
}