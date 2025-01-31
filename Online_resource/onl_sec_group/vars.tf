variable "vpc_id" {}
	
variable sg_name {
	default = ""
	}
variable "describ" {}


variable "default_tags" {
  type = "map"

  default = {
    
    Automation           = "Yes"
	CloudServiceProvider  = "AWS" 
	ManagedBy = "PROVIDE NAME"
	
  }
}


variable "tags" {}	

