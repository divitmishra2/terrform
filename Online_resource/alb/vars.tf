variable "vpc_id" {}
variable "subnet_ids" {}
variable lb_name {}
variable alb_sg_name {}
variable tg_name1 {}
variable tg_name {}
variable target_port {}
variable inst_id {}
#variable inst_id1 {}
variable s3_bucket_name {}
variable bucket_prefix {}
	
### Tag details
variable "default_tags" {
  type = "map"
  default = {
	Automation           = "Yes"
	CloudServiceProvider  = "AWS" 
	ManagedBy = "PROVIDE NAME"
    }
}
variable "tags" {}	