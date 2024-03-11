# Configue the ec2 resource
module "ec2-module" {
  source        = "./modules/ec2"

    
  instance_type = var.instance_type
  aws_region = "us-east-1"
 
}
# Configue the ec2 resource
module "model-call2" {
  source        = "./modules/ec2"
  providers = {
    aws = aws.r2
    }
   
    instance_type = var.instance_type
   aws_region = "us-west-2"
 
}



