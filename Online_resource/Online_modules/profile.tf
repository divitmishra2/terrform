## AWS assume role details and profile name need to be updated here

provider "aws" {
 region     = "eu-west-1"
  profile = ""
  assume_role {
    role_arn     = "PROVIDE ARN"
    }
}
