variable "region" {
     default = "us-east-1"
}
  
variable "api_name" {
  default = "MyAppSyncAPI"
}

variable "dynamodb_table_name" {
  type = string
  default = "FeedbackTable"
}

variable "role_name" {
     default = "AppSyncDynamoDBRole"
  
}