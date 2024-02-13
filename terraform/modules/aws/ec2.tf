locals {
  public_subnets_id =module.vpc.public_subnets
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.ec2.name}-server"
  ami = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = "aws"
#  monitoring             = true
  vpc_security_group_ids = [aws_security_group.server_security_group.id]
  subnet_id              = local.public_subnets_id[0]

  tags = var.tags

}


data "aws_ami" "ubuntu" {
  most_recent = true


  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20231207"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}



