# Configue the ec2 resource
resource "aws_instance" "my-ec2"{
    ami= var.amis_map[var.aws_region]
    instance_type = var.instance_type
    subnet_id = aws_subnet.public.id
}
