# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_iam_role_policy_attachment.studiovpc-notebook-role__studio-vpc-infra-IAM-XE8WWDTVFFJ2-SageMakerNotebookInstancePolicy-1JLTIEYH5S0BD:
resource "aws_iam_role_policy_attachment" "studiovpc-notebook-role__studio-vpc-infra-IAM-XE8WWDTVFFJ2-SageMakerNotebookInstancePolicy-1JLTIEYH5S0BD" {
  policy_arn = aws_iam_policy.studio-vpc-infra-IAM-XE8WWDTVFFJ2-SageMakerNotebookInstancePolicy-1JLTIEYH5S0BD.arn
  role       = aws_iam_role.studiovpc-notebook-role.id
}