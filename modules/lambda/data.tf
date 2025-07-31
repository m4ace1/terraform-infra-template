data "archive_file" "lambda_signup_archive" {
  type        = "zip"
  source_dir  = "${path.module}/codes/signup"
  output_path = "${path.module}/codes/zip/signup.zip"
}

data "archive_file" "lambda_confirm_signup_archive" {
  type        = "zip"
  source_dir  = "${path.module}/codes/confirm-signup"
  output_path = "${path.module}/codes/zip/confirm-signup.zip"
}

data "archive_file" "lambda_login_archive" {
  type        = "zip"
  source_dir  = "${path.module}/codes/login"
  output_path = "${path.module}/codes/zip/login.zip"
}