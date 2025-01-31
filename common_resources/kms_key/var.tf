variable  "kms_key_name" {}
variable kms_description {}
variable account_id {}
variable "tags" {}	
variable "default_tags" {
  type = "map"

  default = {
  
    Automation           = "Yes"
	CloudServiceProvider  = "AWS" 
	ManagedBy = "PROVIDE NAME"
	}
}