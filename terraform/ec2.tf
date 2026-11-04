data "aws_ssm_parameter" "pf_amazon_linux" {
  #Retrieve the Amazon Linux 2023 AMI ID
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_instance" "pf_web_server" {

  ami = data.aws_ssm_parameter.pf_amazon_linux.value

  instance_type = "t3.micro"

  subnet_id = aws_subnet.pf_public_subnet.id

  vpc_security_group_ids = [aws_security_group.pf_web_sg.id]

  associate_public_ip_address = true

  tags = {
    Name = "devops-pf-web-server"
  }

  root_block_device {

    volume_size = 8
    volume_type = "gp3"

    encrypted             = true
    delete_on_termination = true

  }

}

