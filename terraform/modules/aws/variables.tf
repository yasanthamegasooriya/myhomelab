variable "environment" {
    type = object({
      name = string
      region= string
      profile=string 
    }) #example {name="dev",region="eu-west-1",profile=terraformyasanthamylab}
}

variable "vpc" {
  type = object({
    azs = list(string)  #example ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
    cidr = object({
      vpc = string
      public_subnets = list(string)
      private_subnets = list(string)
      database_subnets = list(string) 
    }) 
  })
}

variable "tags" {
  type = object({
    terraform = bool
    environment = string
  })
}
variable "s3" {
  type = object({
    name = string
    acl =string 
  })
}