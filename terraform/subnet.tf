resource "aws_subnet" "pf_public_subnet" {
  
  vpc_id            = aws_vpc.portfolio_vpc.id 
                    #type.name.attribute
  
  cidr_block        = "10.0.1.0/24"
  
  availability_zone = "${var.region1}a"
  
  map_public_ip_on_launch = true
  
  tags = {
    Name = "devops-pf-public-subnet"
  }

}