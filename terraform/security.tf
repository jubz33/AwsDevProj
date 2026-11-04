resource "aws_security_group" "pf_web_sg" {
  name        = "devops-pf-web-sg"
  description = "Security group for portfolio web server"
  vpc_id      = aws_vpc.pf_vpc.id

}

resource "aws_vpc_security_group_ingress_rule" "pf_http_ingress" {

  security_group_id = aws_security_group.pf_web_sg.id
  
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
  cidr_ipv4    = "0.0.0.0/0" 

}