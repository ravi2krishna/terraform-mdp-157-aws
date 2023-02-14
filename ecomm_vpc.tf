# VPC
resource "aws_vpc" "ecomm-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "ecomm-vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "ecomm-igw" {
  vpc_id = aws_vpc.ecomm-vpc.id

  tags = {
    Name = "ecomm igw"
  }
}

# SUBNET
resource "aws_subnet" "ecomm-subnet-a" {
  vpc_id     = aws_vpc.ecomm-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ca-central-1a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "Ecomm-Subnet-A"
  }
}


# SUBNET
resource "aws_subnet" "ecomm-subnet-b" {
  vpc_id     = aws_vpc.ecomm-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ca-central-1b"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "Ecomm-Subnet-B"
  }
}


# Route Table
resource "aws_route_table" "ecomm-rt" {
  vpc_id = aws_vpc.ecomm-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ecomm-igw.id
  }


  tags = {
    Name = "ecomm rt"
  }
}

# Subnet To Route Table Association
resource "aws_route_table_association" "ecomm-a-asc" {
  subnet_id      = aws_subnet.ecomm-subnet-a.id
  route_table_id = aws_route_table.ecomm-rt.id
}

resource "aws_route_table_association" "ecomm-b-asc" {
  subnet_id      = aws_subnet.ecomm-subnet-b.id
  route_table_id = aws_route_table.ecomm-rt.id
}


