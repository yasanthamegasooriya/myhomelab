module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = var.s3.name
  acl    = var.s3.acl

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}