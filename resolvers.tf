resource "aws_appsync_resolver" "query_list_feedbacks" {
  api_id      = aws_appsync_graphql_api.myapi.id
  type        = "Query"
  field       = "listFeedbacks"
  data_source = aws_appsync_datasource.dynamodb.name

  request_template  = file("${path.module}/resolvers/request-listFeedbacks.vtl")
  response_template = file("${path.module}/resolvers/response-listFeedbacks.vtl")
}

resource "aws_appsync_resolver" "create_feedback_resolver" {
  api_id      = aws_appsync_graphql_api.myapi.id
  type        = "Mutation"
  field       = "createFeedback"
  data_source = aws_appsync_datasource.dynamodb.name
  
  request_template = <<EOF
{
  "version": "2017-02-28",
  "operation": "PutItem",
  "key": {
    "type": {
      "S": "$ctx.args.type"
    },
    "date": {
      "S": "$ctx.args.date"
    }
  },
  "attributeValues": {
    "email": { "S": "$ctx.args.email" },
    "message": { "S": "$ctx.args.message" },
    "name": { "S": "$ctx.args.name" },
    "rating": { "S": "$ctx.args.rating" }
  }
}
EOF

  response_template = <<EOF
  #return($ctx.result)
EOF
}