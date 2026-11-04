resource "aws_security_group" "pf_web_sg" {
  name        = "devops-pf-web-sg"
  description = "Security group for portfolio web server"
  vpc_id      = aws_vpc.pf_vpc.id

}
