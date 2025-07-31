resource "aws_ses_email_identity" "femi_email" {
  email = var.FEMI_EMAIL
}

resource "aws_ses_email_identity" "info_email" {
  email = var.INFO_EMAIL
}

