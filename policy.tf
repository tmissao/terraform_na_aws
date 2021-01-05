data "aws_iam_policy_document" "iam_policy_document_my_sqs_on_my_sns_policy" {
  statement {
    principals {
      type = "*"
      identifiers = ["*"]
    }
    effect = "Allow"
    actions = ["sqs:SendMessage"]
    resources = [aws_sqs_queue.my_sqs.arn]
    condition {
      test = "ArnEquals"
      variable = "aws:SourceArn"
      values = [aws_sns_topic.my_sns.arn]
    }
  }
}