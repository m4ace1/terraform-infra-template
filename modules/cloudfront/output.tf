
output "cloudfrontId" {
  value = aws_cloudfront_distribution.s3_noughttrapper_pdf_storage.id
}

output "cloudfront_url" {
  description = "CloudFront Distribution URL"
  value       = "https://${aws_cloudfront_distribution.s3_noughttrapper_pdf_storage.domain_name}"
}

output "cloudfront_distribution_arn" {
  value = aws_cloudfront_distribution.s3_noughttrapper_pdf_storage.arn
}