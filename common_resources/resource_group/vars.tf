variable res_group {}
variable tag_app_acronym {}
variable "default_tags" {
  type = "map"

  default = {
    
    Automation           = "Yes"
	CloudServiceProvider  = "AWS" 
	ManagedBy = "PROVIDE NAME"
	
  }
}
variable "tags" {}	
