
/*
# Define Backup plan details
resource "aws_backup_plan" "BACKUP_NAME" {
  name = "${var.plan_name}"

 
  rule {
    rule_name         = "${var.rule_name}"
    target_vault_name = aws_backup_vault.test.id
    schedule          = "cron(0 12 * * ? *)"
   
  lifecycle {
      delete_after = "${var.life_cycle}"
  }
  recovery_point_tags = "${merge(var.default_tags, map("Name",var.plan_name))}"
  }
  tags = "${merge(var.default_tags, map("Name",var.plan_name), var.tags)}"
}
*/
resource "aws_backup_vault" "test" {
  name        = "${var.vault_name}"
  kms_key_arn = "${var.kms_key}"
  tags = "${merge(var.default_tags, map("Name",var.vault_name), var.tags)}"
}

/*
resource "aws_backup_selection" "flw_selection" {
  iam_role_arn = "${var.iam_arn}"  
  name         = "${var.selection_name}"
  plan_id      = aws_backup_plan.BACKUP_NAME.id

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "Backup"
    value = "True-EC2" 
  }
   selection_tag {
    type  = "STRINGEQUALS"
    key   = "Backup"
    value = "True-EFS" 
  }
  
}
*/