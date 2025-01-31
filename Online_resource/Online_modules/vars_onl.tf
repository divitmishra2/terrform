#### Common Variables

variable "vpc_id" {
	default = "PROVIDE VPC ID"
	}
	
variable account_id {
	default = "ACCOUNT NUMBER"
	}
	
variable "rhl_ami_id" {
	default = "ami-ID"
	}
variable RHL_ImageVersionName {
	default = "ami-NAME"
	}
	
variable "key_name" {
	default = "PROVIDE NAME"
	}
variable "kms_key_arn" {
	default = "PROVIDE ARN/NAME"
	}

variable "trt_subnet_ids" {
  default = ["PROVIDE SUBNET IDs]
  }

## Tag default
variable "default_tags" {
  type = "map"
  default = {
	ApplicationAcronym	= "FRM"
	ApplicationName  = "PROVIDE NAME"
	DRLevel = "1"
	ApplicationOwner = "PROVIDE NAME"
	ApplicationSupport = "PROVIDE NAME"
	DataProfile = "Confidential"
	Environment = "PROVIDE NAME"
	BusinessUnit = "PROVIDE NAME"
	UseCase  =      "3"
	}
}

variable RHL_PatchGroup {
	default = "RedhatEnterpriseLinux7"
	}

#### Online App Server 1 Variables
	
variable onl_app1_instance_name {
	default = "PROVIDE NAME"
	}

variable onl_app1_az {
	default = "eu-west-1b"
	}
	
variable onl_app1_subnet_id {
	default = "PROVIDE NAME"
	}
	
variable onl_app1_inst_type {
	default = "t3.medium"
	}
	
variable onl_app1_tier {
	default = "Application"
	}

#### Online App Server 2 Variables
	
variable onl_app2_instance_name {
	default = "PROVIDE NAME"
	}

variable onl_app2_az {
	default = "eu-west-1a"
	}
	
variable onl_app2_subnet_id {
	default = "PROVIDE NAME"
	}
	
variable onl_app2_inst_type {
	default = "t3.medium"
	}
	
variable onl_app2_tier {
	default = "Application"
	}

## Security Group Variables
variable onl_app_sg_name {
	default = "PROVIDE NAME"
	}
	
### Online ALB Variables

variable onl_lb_name {
	default = "PROVIDE NAME"
	}
	
variable onl_alb_sg_name {
	default = "PROVIDE NAME"
	}

variable onl_tg_name {
	default = "PROVIDE NAME"
	}
	
variable onl_target_port {
	default = "8080"
	}
	
variable onl_bucket_prefix {
	default = "onl-applb01"
	}	
variable onl_tg_name1 {
	default = "PROVIDE NAME"
	}

## S3 Bucket Variables

variable log_bucket_name {
	default = "PROVIDE NAME"
	}
/*
## CloudWatch Alarm Variables

variable log_group_name {
	default = "PROVIDE NAME"
	}
variable actions_enabled {
	default = "true"
	}
	
variable retention_in_days {
	default = "30"
	}
variable threshold_value_p1 {
	default = "90"
	}
	
variable threshold_value_p2 {
	default = "80"
	}
variable alb_threshold_value_p1 {
	default = "2"
	}
variable alb_threshold_value_p2 {
	default = "1"
	}
variable period_in_sec {
	default = "300"
	}
variable flw_sns {
	default = "PROVIDE NAME/ARN"
	}
variable evaluation_periods {
	default = "2"
	}
	
variable alarm_name_cpu_p1 {
	default = ["PROVIDE NAME"]
	}
variable alarm_name_disk_p1 {
	default = ["PROVIDE NAME"]
	}
variable alarm_name_memory_p1 {
	default = ["PROVIDE NAME"]
	}

variable alarm_name_cpu_p2 {
	default = ["PROVIDE NAME"]
	}
variable alarm_name_disk_p2 {
	default = ["PROVIDE NAME"]
	}
variable alarm_name_memory_p2 {
	default = ["PROVIDE NAME"]
	}	
variable alarm_name_alb_p1 {
	default = ["PROVIDE NAME"]
	}
variable alarm_name_alb_p2 {
	default = ["PROVIDE NAME"]
	}
	

### Alarm Description
	
variable cpu_alarm_description_p1 {
	default = "PROVIDE DESCRIPTION"
	}
variable cpu_alarm_description_p2 {
	default = "PROVIDE DESCRIPTION"
	}
	

variable disk_alarm_description_p1 {	
	default = "PROVIDE DESCRIPTION"
	}
variable disk_alarm_description_p2 {	
	default = "PROVIDE DESCRIPTION
	}

variable memory_alarm_description_p1 {
	default = "PROVIDE DESCRIPTION"
	}
variable memory_alarm_description_p2 {
	default = "PROVIDE DESCRIPTION"
	}	
	
variable alarm_alb_p1 {
	default = "PROVIDE DESCRIPTION"
	}
variable alarm_alb_p2 {
	default = "PROVIDE DESCRIPTION"
	}
*/