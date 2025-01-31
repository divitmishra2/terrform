#variable log_group_name {}
variable retention_in_days {}
variable "alarm_disk_p1" {}
variable "alarm_cpu_p1" {}
variable "alarm_memory_p1" {}
variable "alarm_disk_p2" {}
variable "alarm_cpu_p2" {}
variable "alarm_memory_p2" {}
variable alarm_name_alb_p1 {}
variable alarm_name_alb_p2 {}
variable threshold_value_p1 {}
variable threshold_value_p2 {}
variable period {}
variable "evaluation_periods" {}

variable "alb_threshold_value_p1" {}
variable "alb_threshold_value_p2" {}

variable actions_enabled {}
variable target_group {}
variable "snsarn" {}

variable "inst_id" {}

variable "alarm_name_cpu_p1" {}
variable "alarm_name_memory_p1" {}
variable "alarm_name_disk_p1" {}
variable "alarm_name_cpu_p2" {}
variable "alarm_name_memory_p2" {}
variable "alarm_name_disk_p2" {}
variable alarm_alb_p1 {}
variable alarm_alb_p2 {}


variable "image_id" {}
variable "instance_type" {}
variable alb_name {}



variable "tags" {}
variable "default_tags" {
  type = "map"

  default = {
	Automation           = "Yes"
	CloudServiceProvider  = "AWS" 
	Tier	= "Alarm"
	ManagedBy = "PROVIDE NAME"
  }
}