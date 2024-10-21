resource "aws_dynamodb_table" "feedback" {
     name           = var.dynamodb_table_name
     billing_mode   = "PAY_PER_REQUEST"
     hash_key       = "type"
     range_key      = "date"
     attribute {
         name = "type"
         type = "S"
     }
     attribute {
         name = "date"
         type = "S"
     }
  
  tags = {
    Name = var.dynamodb_table_name
  }
}

resource "aws_dynamodb_table_item" "item_1" {
  table_name = aws_dynamodb_table.feedback.name
  hash_key = aws_dynamodb_table.feedback.hash_key
  range_key = aws_dynamodb_table.feedback.range_key

  item = <<ITEM
{
  "type": {"S": "General"},
  "date": {"S": "2024-01-01"},
  "email": {"S": "example@example.com"},
  "message": {"S": "This is a sample feedback message."},
  "name": {"S": "Alejandro"},
  "rating": {"S": "5"}
}
ITEM
}