# EC2 Variables
variable "avb_zone" {}
variable "subnet_id" {}
variable "ec2_count" {
	default = "1"
	}
variable "key_name" {}
variable "kms_key_arn" {}
	
variable "ec2_name" {description = "EC2 Instance Name"}
variable "ami_id" {}
variable "instance_type" {}
variable "sg_ids" {description = "Security Group ID"}
	
variable "tags" {}	
variable "default_tags" {
  type = "map"

  default = {
    Automation           = "Yes"
	CloudServiceProvider  = "AWS" 
	ManagedBy = "PROVIDE NAME"
	}
}



