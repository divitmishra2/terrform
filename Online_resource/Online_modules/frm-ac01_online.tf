### Online Application 

module "Online_App_server1" {
  source = "../ec2_instance_online"
  ami_id = "${var.rhl_ami_id}"
  key_name= "${var.key_name}"
  kms_key_arn = "${var.kms_key_arn}"
  sg_ids    = "${module.Online_App_sec_group.sec_ids}"
  ec2_name = "${var.onl_app1_instance_name}"
  avb_zone = "${var.onl_app1_az}"
  subnet_id = "${var.onl_app1_subnet_id}"
  instance_type = "${var.onl_app1_inst_type}"
  tags = "${merge(var.default_tags, map("Tier", var.onl_app1_tier), map("AvailabilityZone", var.onl_app1_az), map("Patch Group", var.RHL_PatchGroup), map("ImageVersionName", var.RHL_ImageVersionName), map("Backup", "False-EC2"))}"
}


module "Online_App_server2" {
  source = "../ec2_instance_online"
  ami_id = "${var.rhl_ami_id}"
  key_name= "${var.key_name}"
  kms_key_arn = "${var.kms_key_arn}"
  sg_ids    = "${module.Online_App_sec_group.sec_ids}"
  ec2_name = "${var.onl_app2_instance_name}"
  avb_zone = "${var.onl_app2_az}"
  subnet_id = "${var.onl_app2_subnet_id}"
  instance_type = "${var.onl_app2_inst_type}"
  tags = "${merge(var.default_tags, map("Tier", var.onl_app2_tier), map("AvailabilityZone", var.onl_app2_az), map("Patch Group", var.RHL_PatchGroup), map("ImageVersionName", var.RHL_ImageVersionName), map("Backup", "False-EC2"))}"
}


### Online App Server Security group

module "Online_App_sec_group" {
  source = "../onl_sec_group"
  vpc_id = "${var.vpc_id}"
  sg_name = "${var.onl_app_sg_name}"
  describ = ""
  tags = "${merge(var.default_tags, map("Tier", var.onl_app1_tier))}"

}

module "frm_online_alb" {
	source = "../alb"
	vpc_id = "${var.vpc_id}"
	subnet_ids = "${var.trt_subnet_ids}" 
	lb_name = "${var.onl_lb_name}"
	alb_sg_name = "${var.onl_alb_sg_name}"
	tg_name = "${var.onl_tg_name}"
	
	######### for rule extra TG ###
	tg_name1 = "${var.onl_tg_name1}"
	target_port = "${var.onl_target_port}"
#	inst_id1 = "PROVIDE INSTANCEX ID"}"
	inst_id = ["${module.Online_App_server1.ec2_id}", "${module.Online_App_server2.ec2_id}"]
	tags = "${merge(var.default_tags, map("Tier", var.onl_app1_tier))}"
	s3_bucket_name = "${var.log_bucket_name}"
	bucket_prefix = "${var.onl_bucket_prefix}"
	
	}
/*
### CloudWatch Alarm config
module "cloudwatch_alarm" {
	source = "../cloud_watch_online"
#	log_group_name = "${var.log_group_name}"
	retention_in_days = "${var.retention_in_days}"
	tags = "${var.default_tags}"

	### Alarm variables
	actions_enabled			= "${var.actions_enabled}"
	threshold_value_p1 = "${var.threshold_value_p1}"
	threshold_value_p2 = "${var.threshold_value_p2}"
	
	alb_threshold_value_p1 = "${var.alb_threshold_value_p1}"
	alb_threshold_value_p2 = "${var.alb_threshold_value_p2}"
	
	period = "${var.period_in_sec}"
	snsarn = "${var.flw_sns}"
	evaluation_periods = "${var.evaluation_periods}"
	
	inst_id = ["${module.Online_App_server1.ec2_id}","${module.Online_App_server2.ec2_id}"]
			
	image_id = ["${module.Online_App_server1.ec2_ami_id}","${module.Online_App_server2.ec2_ami_id}"]
	
	instance_type = ["${module.Online_App_server1.ec2_instance_type}","${module.Online_App_server2.ec2_instance_type}"]
	
	alb_name = ["${module.flw_online_alb.alb_id_suffix}"]
	target_group = ["${module.flw_online_alb.alb_target_id_suffix}"]
	
	### CPU metric variables
	
	alarm_name_cpu_p1 = "${var.alarm_name_cpu_p1}"
	alarm_cpu_p1 = "${var.cpu_alarm_description_p1}"
	
	alarm_name_cpu_p2 = "${var.alarm_name_cpu_p2}"
	alarm_cpu_p2 = "${var.cpu_alarm_description_p2}"
		
	## Disk Utilization variables
	
	alarm_name_disk_p1 = "${var.alarm_name_disk_p1}"
	alarm_disk_p1 = "${var.disk_alarm_description_p1}"
	
	alarm_name_disk_p2 = "${var.alarm_name_disk_p2}"
	alarm_disk_p2 = "${var.disk_alarm_description_p2}"
	
	## Memory Utilization Variables
	
	alarm_name_memory_p1 = "${var.alarm_name_memory_p1}"
	alarm_memory_p1 = "${var.memory_alarm_description_p1}"
	
	alarm_name_memory_p2 = "${var.alarm_name_memory_p2}"
	alarm_memory_p2 = "${var.memory_alarm_description_p2}"
	
	### ALB Health Check Variables

	alarm_name_alb_p1	= "${var.alarm_name_alb_p1}"
	alarm_name_alb_p2	= "${var.alarm_name_alb_p2}"
	
	alarm_alb_p1 = "${var.alarm_alb_p1}"
	alarm_alb_p2 = "${var.alarm_alb_p2}"
		
	}
*/