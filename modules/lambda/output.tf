# =================================================================
#  SIGNUP
# =================================================================
output "LAMBDA_SIGN_UP_FUNCTION_ARN" {
  value = aws_lambda_function.signup_function.arn
}
output "LAMBDA_SIGN_UP_FUNCTION_NAME" {
  value = aws_lambda_function.signup_function.function_name
}
