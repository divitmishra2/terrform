## AWS assume role details and profile name need to be updated here

provider "aws" {
 region     = "eu-west-1"
  profile = "Profile_name"
  assume_role {
    role_arn     = "Role_Arn"
    }
}
