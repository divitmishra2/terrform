## Terraform Function for crating EFS

resource "aws_efs_file_system" "my_efs" {
  creation_token = "${var.efs_name}"  
  encrypted = "true"
  kms_key_id = "${var.kms_key_id}"
  tags       = "${merge(var.default_tags, map("Name", var.efs_name), var.tags)}"
}

## EFS Accesspoint creation
resource "aws_efs_access_point" "efs_accesspoint" {
  file_system_id = aws_efs_file_system.my_efs.id
  posix_user {
    gid = "${var.posix_gid}"
    uid = "${var.posix_uid}"
  }
  tags       = "${merge(var.default_tags, map("Name", var.efs_ap_name), var.tags)}"
}


## EFS Mount target for Network
resource "aws_efs_mount_target" "efs_network" {
  count = length("${var.subnet_id}")
  file_system_id = aws_efs_file_system.my_efs.id
  subnet_id      = "${var.subnet_id[count.index]}"
  security_groups = ["${aws_security_group.efs_sg.id}"]
}

