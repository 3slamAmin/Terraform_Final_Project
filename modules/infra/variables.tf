variable "instance_type" {
  description = "to define the instance_type of ec2 instance"
  type        = string
}
variable "aws_region" {
  description = "to define the aws_region of ec2 instance"
  type        = string
}

variable "amis_map" {
  description = "Map of AMIs for different AWS regions"
  type        = map(string)

  default = {
    us-east-1 = "ami-006dcf34c09e50022"
    us-west-2 = "ami-0eb5115914ccc4bc2"

  }
}




