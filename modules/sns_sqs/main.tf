resource "aws_sns_topic" "my_sns" {
  name = var.topic_name
  tags = var.tags
}

resource "aws_sqs_queue" "my_sqs" {
  name = var.topic_name
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