terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "Bucket_Name"
    region         = "Region_Name"
    key            = "Key_Name"
	role_arn       = "Role_ARN"
    profile        = "Profile_Name"
    session_name   = "terraform"
    }
}