# =================================================================
#  SIGNUP  ROLE
# =================================================================
output "SIGN_UP_FUNCTION_ROLE_ARN" {
  value = aws_iam_role.sign_up_function_role.arn
}
output "SIGN_UP_FUNCTION_ROLE_NAME" {
  value = aws_iam_role.sign_up_function_role.name
}
