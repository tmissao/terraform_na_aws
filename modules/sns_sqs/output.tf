output "sns_arn" {
  value = aws_sns_topic.my_sns.arn
}

output "sqs_url" {
  value = aws_sqs_queue.my_sqs.id
}