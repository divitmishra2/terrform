variable "vpc_id" {}
variable efs_name {}
variable efs_ap_name {}
variable kms_key_id {}
variable subnet_id {}
variable posix_gid {}
variable posix_uid {}
variable efs_sg_name {}

### Tag details
variable "default_tags" {
  type = "map"

  default = {
	Automation           = "Yes"
	CloudServiceProvider  = "AWS" 
	Tier	= "Storage"
	ManagedBy = "PROVIDE NAME"
    
  }
}
variable "tags" {}

variable account_id {}