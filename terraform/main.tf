module "vpc" {
  source = "./modules/aws"
  vpc=var.vpc
  environment = var.environment
  tags = var.tags
  s3 = var.s3
}