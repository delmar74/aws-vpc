locals {
    public_cidr = ["10.0.0.0/24", "10.0.1.0/24"]
    private_cidr = ["10.0.10.0/24", "10.0.11.0/24"]
}

# VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# subnet
resource "aws_subnet" "public" {

  count = 2

  vpc_id     = aws_vpc.main.id
  cidr_block = local.public_cidr[count.index]

  tags = {
    Name = "public${count.index}"
  }
}

resource "aws_subnet" "private" {
  count = 2

  vpc_id     = aws_vpc.main.id
  cidr_block = local.private_cidr[count.index]

  tags = {
    Name = "private${count.index}"
  }
}

# IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

# EIP
resource "aws_eip" "nat" {
  count = 2

  vpc      = true
}

# NGW
resource "aws_nat_gateway" "ngw" {
  count = 2 

  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  tags = {
    Name = "main"
  }
  #depends_on = [aws_internet_gateway.example]
}

# route tables (public and private)
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public"
  }
}

resource "aws_route_table" "private" {
  count = 2

  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw[count.index].id 
  }

  tags = {
    Name = "private${count.index}"
  }
}
