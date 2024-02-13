environment = {
  name = "dev"
  region = "us-east-1"
  profile = "yasanthaterraformlab"
}

vpc = {
  azs = [ "us-east-1a", "us-east-1b","us-east-1c" ]
  cidr = {
    vpc = "10.1.0.0/16" #VPC CIDR
    public_subnets = [ "10.1.1.0/24","10.1.3.0/24","10.1.5.0/24" ] # Private subnet CIDRs
    private_subnets = ["10.1.2.0/24","10.1.4.0/24","10.1.6.0/24"] # public Subnet CIDRs
    database_subnets = ["10.1.7.0/24","10.1.8.0/24","10.1.9.0/24"]
  }
}

tags = {
  terraform = true
  environment = "dev"
}
s3 = {
  name = "terraformyasanthamylab-dev"
  acl = "private"
}
ec2 = {
  name= "jenkins"
}