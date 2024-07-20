provider "aws" {
  alias                   = "localstack"
  region                  = "sa-east-1"  
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  endpoints {
    dynamodb = "http://localhost:4566" # Use the LocalStack endpoint
  }
}

resource "aws_dynamodb_table" "user_table" {
  provider = aws.localstack  # Use the LocalStack-specific provider alias
  name           = "client"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "client_id"

  attribute {
    name = "client_id"
    type = "S"
  }
  
}

resource "aws_dynamodb_table" "order_table" {
  provider = aws.localstack  # Use the LocalStack-specific provider alias
  name           = "user"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "order_id"

  attribute {
    name = "order_id"
    type = "S"
  }
}