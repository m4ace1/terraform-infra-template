resource "aws_s3_bucket" "m4ace" {
  bucket = var.bucket_name

  tags = {
    Name = "m4ace-${var.environment}-bucket"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.m4ace.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "m4ace-public_access" {
  bucket                  = aws_s3_bucket.m4ace.id
  block_public_acls       = true
  block_public_policy     = false # Disable blocking public policies
  ignore_public_acls      = true
  restrict_public_buckets = false
}

# resource "aws_s3_bucket_policy" "bucket_policy" {
#   bucket = aws_s3_bucket.m4ace.id
#   policy = jsonencode({
#     "Version" : "2012-10-17",
#     "Statement" : [
#       {
#         "Sid" : "AllowReadOnlyAccess",
#         "Effect" : "Allow",
#         "Principal" : "*",
#         "Action" : "s3:*",
#         "Resource" : "arn:aws:s3:::${var.bucket_name}/*"
#       }
#     ]
#   })
# }
