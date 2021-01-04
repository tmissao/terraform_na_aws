resource "aws_s3_bucket" "s3_bucket" {
  bucket = "workshop-my-terraform-bucket"
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_access_block" {
  bucket = aws_s3_bucket.s3_bucket.id
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "dynamodb" {
  name = "workshop-my-terraform-dynamodb"
  hash_key = "LockID"
  read_capacity  = 20
  write_capacity = 20
  attribute {
    name = "LockID"
    type = "S"
  }
}