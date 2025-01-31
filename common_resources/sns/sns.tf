### SNS topic Creation Script

resource "aws_sns_topic" "sns_topic" {
  name = "${var.sns_topic_name}"
  display_name = "${var.sns_disp_name}"
#  kms_master_key_id = "alias/${var.kms_id}"
  tags   = "${merge(var.default_tags, map("Name",var.sns_topic_name),var.tags)}"
}


output "id" {
  value = "${aws_sns_topic.sns_topic.id}"
}

output "arn" {
  value = "${aws_sns_topic.sns_topic.arn}"
}