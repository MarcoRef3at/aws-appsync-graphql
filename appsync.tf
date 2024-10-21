resource "aws_appsync_graphql_api" "myapi" {
  name                = var.api_name
  authentication_type = "API_KEY"
  schema              = file("${path.module}/schema.graphql")
}

resource "aws_appsync_api_key" "default" {
  api_id  = aws_appsync_graphql_api.myapi.id
  expires = local.api_key_expiration
}
