data "aws_region" "current" {}

data "aws_iam_policy_document" "example" {
  #{
  #  "Version": "2012-10-17",
  statement {
    sid = "1"
    actions = [
      "ssm:List*",
      "ssm:Get*",
      "ssm:UpdateInstanceInformation",
    ]
    
    resources = [
      "*",
    ]
  }
}
#{
#    "Statement": [
#      {
#        "Sid": "ReadOnlyAccess",
#        "Principal": "*",
#        "Action": [
#                "ssm:List*",
#                "ssm:Get*",
#                "ssm:UpdateInstanceInformation",
#            ],   
#        "Effect": "Allow",
#        "Resource": "*"
#        }
#    ]
#}
#}
