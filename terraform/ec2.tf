data "aws_ssm_parameter" "pf_amazon_linux" {
  #Retrieve the Amazon Linux 2023 AMI ID
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"

}