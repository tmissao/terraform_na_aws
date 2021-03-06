variable "aws_access_key" { type = string }
variable "aws_secret_key" { type = string }
variable "aws_region" { default = "us-east-2" }

############################################################################################
#                                AWS Backend S3                                            #
############################################################################################
# variable "s3_name" { type = string }
# variable "dynamo_name" { type = string }
############################################################################################

variable "topic1_name" { type = string }
variable "topic2_name" { type = string }

variable "tags" { 
  default = { 
    "owner" = "Missão"
    "terraform" =  true
  }
}
