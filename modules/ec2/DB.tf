resource "aws_dynamodb_table" "tf_notes_table" {
 name = "tf-notes-table"
 billing_mode = "PROVISIONED"
 read_capacity= "30"
 write_capacity= "30"
 attribute {
  name = "noteId"
  type = "S"
 }
 hash_key = "noteId"
}

  resource "aws_vpc_endpoint" "dynamodb" {
  vpc_id          = aws_vpc.main.id
  service_name    = "com.amazonaws.${var.aws_region}.dynamodb"
  route_table_ids = [aws_route_table.r_nat.id]

  tags = {
    Name = "my-dynamodb-endpoint"
  }
}