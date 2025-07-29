variable "CURRENT_ACCOUNT_ID" {}
variable "ENV" {}
variable "BASE_PATH" {
  default = "open"
}

variable "LAMBDA_NAMES" {
  description = "contains Names of lambda(s) to be added into <aws_lambda_permission> resource"
  type        = list(string)
}
variable "RESOURCES_PREFIX" {}
variable "API_DOMAIN_NAME" {

}


variable "CERTIFICATE_ARN" {
  description = "The ARN of the ACM certificate for HTTPS"
}


variable "LAMBDA_SIGN_UP_FUNCTION_ARN" {}