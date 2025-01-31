terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "PROVIDE NAME"
    region         = "eu-west-1"
    key            = "PROVIDE NAME"
	role_arn       = "PROVIDE ARN"
    profile        = ""
    session_name   = "terraform"
    }
}