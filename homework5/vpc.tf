# vpc
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_settings.cidr
  enable_dns_support = var.vpc_settings.dns_support
  enable_dns_hostnames = var.vpc_settings.dns_hostnames
  tags = {
    Name = "kaizen"
  }
}

# public subnet 
resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnets[0].cidr
  availability_zone = local.azs[0]
  tags = {
    Name = var.subnets[0].name
  }
}

resource "aws_subnet" "public2" {
   vpc_id     = aws_vpc.main.id
  cidr_block = var.subnets[1].cidr
  availability_zone = local.azs[1]
  tags = {
    Name = var.subnets[1].name
  }
}

# private subnet 
resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnets[2].cidr
  availability_zone = local.azs[2]
  tags = {
    Name = var.subnets[2].name
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnets[3].cidr
  availability_zone = local.azs[3]
  tags = {
    Name = var.subnets[3].name
  }
}

# internet gateway 
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.internet_gateway_name
  }
}

# route table 
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.route_table_names.public
  }
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.route_table_names.private
  }
}

# Routes
resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}

# route table assosiation 
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private-rt.id
}
