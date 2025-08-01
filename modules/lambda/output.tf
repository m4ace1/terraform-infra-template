# =================================================================
#  SIGNUP
# =================================================================
output "LAMBDA_SIGN_UP_FUNCTION_ARN" {
  value = aws_lambda_function.signup_function.arn
}
output "LAMBDA_SIGN_UP_FUNCTION_NAME" {
  value = aws_lambda_function.signup_function.function_name
}

# =================================================================
#  CONFIRM SIGNUP
# =================================================================
output "LAMBDA_CONFIRM_SIGN_UP_FUNCTION_ARN" {
  value = aws_lambda_function.confirm_signup_function.arn
}
output "LAMBDA_CONFIRM_SIGN_UP_FUNCTION_NAME" {
  value = aws_lambda_function.confirm_signup_function.function_name
}

# =================================================================
#  CONFIRM FORGOT PASSWORD
# =================================================================
output "LAMBDA_CONFIRM_FORGOT_PASSWORD_FUNCTION_ARN" {
  value = aws_lambda_function.confirm_forgot_password_function.arn
}
output "LAMBDA_CONFIRM_SIGN_UP_FUNCTION_NAME" {
  value = aws_lambda_function.confirm_forgot_password_function.function_name
}

# =================================================================
#  LOGIN SIGNUP
# =================================================================
output "LAMBDA_LOGIN_FUNCTION_ARN" {
  value = aws_lambda_function.login_function.arn
}
output "LAMBDA_LOGIN_FUNCTION_NAME" {
  value = aws_lambda_function.login_function.function_name
}