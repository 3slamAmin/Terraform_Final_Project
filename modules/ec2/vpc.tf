resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public"
  }
}
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private"
  }
}
// create route table with route of anywhere
resource "aws_route_table" "main_route_table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "main_route_table"
  }
}
resource "aws_internet_gateway" "gw" {

  vpc_id = aws_vpc.main.id
  tags = {
    Name = "gw"
  }
}
resource "aws_route_table_association" "a" {

  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.main_route_table.id

}
resource "aws_nat_gateway" "nat_gw" {

  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public.id
  tags = {
    Name = "gw NAT"
  }
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_eip" "nat_eip" {

  vpc = true
}
resource "aws_route_table" "r_nat" {
  vpc_id = aws_vpc.main.id
  route {

    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw.id
  }
  tags = {

    Name = "route table private_nat"
  }

}
resource "aws_route_table_association" "nat_private" {

  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.r_nat.id

}




 