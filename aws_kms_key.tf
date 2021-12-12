# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_kms_key.k_91cd80cf-44d9-4956-8fce-3065896af83c:
resource "aws_kms_key" "k_sagemaker" {
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  description              = "KMS key for S3 buckets"
  enable_key_rotation      = false
  is_enabled               = true
  key_usage                = "ENCRYPT_DECRYPT"
  policy = jsonencode(
    {
      Id = "key-policy-1"
      Statement = [
        {
          Action = "kms:*"
          Effect = "Allow"
          Principal = {
            AWS = format("arn:aws:iam::%s:root",data.aws_caller_identity.current.account_id)
          }
          Resource = "*"
          Sid      = "Enable IAM User Permissions"
        },
        {
          Action = [
            "kms:Encrypt",
            "kms:Decrypt",
            "kms:ReEncrypt",
            "kms:GenerateDataKey",
            "kms:DescribeKey",
          ]
          Condition = {
            StringNotEquals = {
              "aws:sourceVpce" = "vpce-0ca818e2255add312"
            }
          }
          Effect = "Allow"
          Principal = {
            AWS = format("arn:aws:iam::%s:root",data.aws_caller_identity.current.account_id)
          }
          Resource = "*"
          Sid      = "Allow access for Key Users"
        },
      ]
      Version = "2012-10-17"
    }
  )
  tags = {
    "Name" = "studiovpc"
  }
  tags_all = {
    "Name" = "studiovpc"
  }
}