resource "aws_internet_gateway" "pf_igw" {
  vpc_id = aws_vpc.pf_vpc.id

  tags = {
    Name = "devops-pf-igw"
  }

}