resource "aws_internet_gateway" "pf_igw" {
  vpc_id = aws_vpc.pf_vpc.id

  tags = {
    Name = "devops-pf-igw"
  }

}

resource "aws_route_table" "pf_public_rt" {
  vpc_id = aws_vpc.pf_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.pf_igw.id
  }

  tags = {
    Name = "devops-pf-public-rt"
  }

}

