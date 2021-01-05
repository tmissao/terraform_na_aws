############################################################################################
#                                AWS Backend S3                                            #
############################################################################################

# resource "aws_s3_bucket" "s3_bucket" {
#   bucket = var.s3_name
#   acl    = "private"
#   tags = var.tags
# }

# resource "aws_s3_bucket_public_access_block" "s3_bucket_access_block" {
#   bucket = aws_s3_bucket.s3_bucket.id
#   block_public_acls   = true
#   block_public_policy = true
#   ignore_public_acls = true
#   restrict_public_buckets = true
# }

# resource "aws_dynamodb_table" "dynamodb" {
#   name = var.dynamo_name
#   hash_key = "LockID"
#   read_capacity  = 20
#   write_capacity = 20
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
#   tags = var.tags
# }

############################################################################################

module "topic1" {
  source = "./modules/sns_sqs"
  topic_name = var.topic1_name
  tags = var.tags
}

module "topic2" {
  source = "./modules/sns_sqs"
  topic_name = var.topic2_name
  tags = var.tags
}