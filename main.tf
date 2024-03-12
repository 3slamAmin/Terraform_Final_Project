# Configue the ec2 resource
module "module_east" {
  source = "./modules/infra"
  instance_type = var.instance_type
  aws_region    = "us-east-1"
}
# Configue the ec2 resource
module "module_west" {
  source = "./modules/infra"
  providers = {
    aws = aws.r2
  }
  instance_type = var.instance_type
  aws_region    = "us-west-2"
}



