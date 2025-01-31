#### Common Variables
variable "vpc_id" {
	default = "VPC_ID"
	}	
variable account_id {
	default = "Account_ID"
	}
variable "key_name" {
	default = "Key_Name"
	}
variable "subnet_ids" {
  default = ["Subnet_IDS"]
  	}

## KMS Key Name
variable kms_key_name {
	default = "Default_Key_Name"
	} 
variable kms_description {
	default = "ENTER DESCRIPTION FOR THE KMS KEY"
	}

## Tag default
variable "default_tags" {
  type = "map"
  default = {
	ApplicationAcronym	= "VALUE"
	ApplicationName  = "VALUE"
	DRLevel = "VALUE"
	ApplicationOwner = "VALUE"
	ApplicationSupport = "VALUE"
	DataProfile = "VALUE"
	Environment = "VALUE"
	BusinessUnit = "VALUE"
		UseCase  =      "VALUE"
	}
}


### EFS Variables

variable efs_name {
	default = "PROVIDE NAME"
	}
variable efs_ap_name {
	default = "PROVIDE NAME"
	}
variable efs_sg_name {
	default = "PROVIDE NAME"
	}
variable posix_gid {
	default = "0"
	}
variable posix_uid {
	default = "0"
	}


## S3 Bucket Variables
variable log_bucket_name {
	default = "PROVIDE NAME"
	}
variable s3_bucket_name {
	default = ["PROVIDE NAME"]
	}
variable lc_prefix { 
     default    =  "pidfiles/"
	 }
variable lc_id { 
     default    =  "pidfiles"
	 }
variable lc_expire { 
     default    =  2
	 }
variable s3_state_bucket_name {
	default = ["PROVIDE NAME"]
	}

/*
### SNS Variables

variable sns_topic_name {
	default = "PROVIDE NAME"
	}
variable sns_disp_name {
	default = "PROVIDE NAME"
	}
*/
### Resource Group Variables

variable res_group {
	default = "PROVIDE NAME"
	}
variable tag_app_acronym {
	default = "PROVIDE NAME"
	}

/*
## Backup variable

variable plan_name {
	default = "PROVIDE NAME"
	}
	
variable vault_name {
	default = "PROVIDE NAME"
	}
	
variable rule_name {
	default = "PROVIDE NAME"
	}
variable selection_name {
	default = "PROVIDE NAME"
	}
	
variable life_cycle {
	default = 60
	}

variable iam_arn {
	default = "PROVIDE ARN FOR ROLE"
	}	
	
*/
	
	
