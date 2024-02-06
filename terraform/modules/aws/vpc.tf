module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.environment.name}-vpc"
  cidr = var.vpc.cidr.vpc

  azs             = var.vpc.azs
  private_subnets = var.vpc.cidr.private_subnets
  public_subnets  = var.vpc.cidr.public_subnets

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = var.tags
}