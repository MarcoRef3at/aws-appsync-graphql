resource "aws_appsync_datasource" "dynamodb" {
   api_id           = aws_appsync_graphql_api.myapi.id
  name             = "DynamoDB"
  type             = "AMAZON_DYNAMODB"
  service_role_arn = aws_iam_role.appsync_role.arn

  dynamodb_config {
    table_name = aws_dynamodb_table.feedback.name
  }
}