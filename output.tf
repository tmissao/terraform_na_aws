############################################################################################
#                                AWS Backend S3                                            #
############################################################################################
# output "s3_id" {
#   description = "S3`s ID"
#   value       = aws_s3_bucket.s3_bucket.id
# }

# output "s3_arn" {
#   description = "S3`s ARN"
#   value       =  aws_s3_bucket.s3_bucket.arn
# }

# output "dynamodb_id" {
#   description = "DynamoDB`s ID"
#   value       = aws_dynamodb_table.dynamodb.id
# }

# output "dynamodb_arn" {
#   description = "DynamoDB`s ARN"
#   value       =  aws_dynamodb_table.dynamodb.arn
# }
############################################################################################

output "topic1" {
  value = module.topic1
}

output "topic2" {
  value = module.topic2
}