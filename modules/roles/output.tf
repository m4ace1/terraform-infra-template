# =================================================================
#  SIGNUP  ROLE
# =================================================================
output "SIGN_UP_FUNCTION_ROLE_ARN" {
  value = aws_iam_role.sign_up_function_role.arn
}
output "SIGN_UP_FUNCTION_ROLE_NAME" {
  value = aws_iam_role.sign_up_function_role.name
}
# =================================================================
#  CONFIRM SIGNUP  ROLE
# =================================================================
output "CONFIRM_SIGN_UP_FUNCTION_ROLE_ARN" {
  value = aws_iam_role.confirm_sign_up_function_role.arn
}
output "CONFIRM_SIGN_UP_FUNCTION_ROLE_NAME" {
  value = aws_iam_role.confirm_sign_up_function_role.name
}
