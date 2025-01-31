variable sns_topic_name {}
variable sns_disp_name {}

#variable kms_id {}
	
### Tag details
variable "tags" {}	
variable "default_tags" {
  type = "map"

  default = {
    Automation           = "Yes"
	CloudServiceProvider  = "AWS" 
	ManagedBy = "PROVIDE NAME"
	}
}


