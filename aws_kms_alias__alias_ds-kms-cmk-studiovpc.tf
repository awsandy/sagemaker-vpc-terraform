# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_kms_alias.alias_ds-kms-cmk-studiovpc:
resource "aws_kms_alias" "alias_ds-kms-cmk-studiovpc" {
  name          = "alias/ds-kms-cmk-studiovpc"
  target_key_id = aws_kms_key.k_sagemaker.id
}
