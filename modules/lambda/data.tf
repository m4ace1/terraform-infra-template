data "archive_file" "lambda_signup_archive" {
  type        = "zip"
  source_dir  = "${path.module}/codes/signup"
  output_path = "${path.module}/codes/zip/signup.zip"
}