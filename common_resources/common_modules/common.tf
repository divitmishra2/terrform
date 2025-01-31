###############  Below are the shared resource ##############
module "s3_log" {
	source = "../s3_log"
	bucket_name = "${var.log_bucket_name}"
	tags = "${var.default_tags}"

	}

module "s3_bucket" {
	source = "../s3_bucket_batch"
	s3_bucket_name = "${var.s3_bucket_name}"
	kms_key_arn = "${module.kms_key.key_arn}"
#	tags = "${var.default_tags}"
      lc_id      = var.lc_id
     lc_prefix = var.lc_prefix
lc_expire = var.lc_expire

	tags = "${merge(var.default_tags, map("Backup", "Flase-S3"))}"
}

module "s3_state_bucket" {
	source = "../s3_bucket"
	s3_bucket_name = "${var.s3_state_bucket_name}"
	kms_key_arn = "${module.kms_key.key_arn}"
#	tags = "${var.default_tags}"
	tags = "${merge(var.default_tags, map("Backup", "False-S3"))}"
	}
		
module "kms_key" {
	source = "../kms_key"
	kms_key_name = "${var.kms_key_name}"
	account_id = "${var.account_id}"
	kms_description = "${var.kms_description}"
	tags = "${var.default_tags}"
	}
/*
module "sns" {
	source = "../sns"
	sns_topic_name = "${var.sns_topic_name}"
	sns_disp_name = "${var.sns_disp_name}"
#	kms_id = "${var.kms_key_name}"
	tags = "${var.default_tags}"
	}

module "backup" {
	source = "../backup"
	kms_key = "${module.kms_key.key_arn}"
	plan_name = "${var.plan_name}"
	vault_name = "${var.vault_name}"
	rule_name = "${var.rule_name}"
	life_cycle = "${var.life_cycle}" 
	iam_arn = "${var.iam_arn}"
	selection_name = "${var.selection_name}"
	tags = "${var.default_tags}"
	}
	
*/	
	
### EFS Creation

module "efs" {
	source = "../efs"
	vpc_id = "${var.vpc_id}"	
	efs_name = "${var.efs_name}"
	efs_ap_name = "${var.efs_ap_name}"
	kms_key_id = "${module.kms_key.key_arn}"
	subnet_id = "${var.subnet_ids}"
	efs_sg_name = "${var.efs_sg_name}"
	account_id = "${var.account_id}"
	posix_gid = "${var.posix_gid}"
	posix_uid = "${var.posix_uid}"
#	tags = "${var.default_tags}"
	tags = "${merge(var.default_tags, map("Backup", "False-EFS"))}"
	}
	
module "resource_group" {
	source = "../resource_group"
	res_group = "${var.res_group}"
	tag_app_acronym = "${var.tag_app_acronym}"
	tags = "${var.default_tags}"
	}



