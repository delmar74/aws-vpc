provider "aws" {
  region = var.region
}


# VPC
resource "aws_vpc" "main" {
  cidr_block = var.base_cidr_block

  tags = {
    Name = "${var.env_id}-vpc"
  }
}

# subnet
resource "aws_subnet" "public" {
  count             = length(var.availability_zones)
  availability_zone = var.availability_zones[count.index]

  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index + 1)

  tags = {
    Name = "${var.env_id}-${count.index}-public-subnet"
  }
}

resource "aws_subnet" "private" {
  count             = length(var.availability_zones)
  availability_zone = var.availability_zones[count.index]

  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index + 11)

  tags = {
    Name = "${var.env_id}-${count.index}-private-subnet"
  }
}

# IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.env_id}-igw"
  }
}

# EIP
resource "aws_eip" "nat" {
  count = length(var.availability_zones)

  vpc = true

  tags = {
    Name = "${var.env_id}-${count.index}-eip"
  }
}

# NGW
resource "aws_nat_gateway" "ngw" {
  count = length(var.availability_zones)

  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  tags = {
    Name = "${var.env_id}-${count.index}-ngw"
  }
}

# route tables (public and private)
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.env_id}-public-rt"
  }
}

resource "aws_route_table" "private" {
  count = length(var.availability_zones)

  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw[count.index].id
  }

  tags = {
    Name = "${var.env_id}-${count.index}-private-rt"
  }
}
