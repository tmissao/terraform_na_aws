terraform {
  backend "s3" {
    dynamodb_table = "workshop-my-terraform-dynamodb"
    bucket         = "workshop-my-terraform-bucket"
    key            = "terraform/resources/backend/state.tf"
    region         = "us-east-2"
    encrypt        = true
  }
}