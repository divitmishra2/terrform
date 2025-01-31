
variable plan_name {}	
variable vault_name {}	
variable rule_name {}
variable life_cycle {}
variable kms_key {}
variable iam_arn {}
variable selection_name {}
variable "default_tags" {
  type = "map"
  default = {
    Automation           = "Yes"
	CloudServiceProvider  = "AWS" 
	ManagedBy = "NAME"	
	}
}
variable "tags" {}	


