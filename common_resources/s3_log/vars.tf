variable bucket_name {}
	
### KMS Key values

#variable "vpc_id" {}
	
### Tag details
variable "tags" {}	
variable "default_tags" {
  type = "map"

  default = {
	Automation           = "Yes"
	CloudServiceProvider  = "AWS" 
	Tier	= "Storage"
	ManagedBy = "PROVIDE NAME"
  }
}


