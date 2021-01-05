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

resource "aws_sns_topic" "my_sns" {
  name = var.sns_name
  tags = var.tags
}

resource "aws_sqs_queue" "my_sqs" {
  name = var.sqs_name
  message_retention_seconds = var.sqs_retention_time
  tags = var.tags
}

resource "aws_sns_topic_subscription" "my_sqs_on_my_sns" {
  topic_arn = aws_sns_topic.my_sns.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.my_sqs.arn
}

resource "aws_sqs_queue_policy" "my_sqs_on_my_sns_policy" {
  queue_url = aws_sqs_queue.my_sqs.id
  policy = data.aws_iam_policy_document.iam_policy_document_my_sqs_on_my_sns_policy.json
}