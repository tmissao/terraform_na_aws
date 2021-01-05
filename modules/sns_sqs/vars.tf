variable "topic_name" { type = string }
variable "sqs_retention_time" { default = 1209600 }
variable "tags" { type = map(string) }