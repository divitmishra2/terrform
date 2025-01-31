
# Define S3 bucket for application logs

resource "aws_s3_bucket" "my_bucket" {
  count = length("${var.s3_bucket_name}")
  bucket = "${var.s3_bucket_name[count.index]}"
  acl    = "private"
  tags   = "${merge(var.default_tags, map("Name",var.s3_bucket_name[count.index]), var.tags)}"

   server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${var.kms_key_arn}"
        sse_algorithm     = "aws:kms"
      }
    }
  }
}


resource "aws_s3_bucket_public_access_block" "Public_access" {
  count = length("${var.s3_bucket_name}")
  bucket = "${aws_s3_bucket.my_bucket[count.index].id}"

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true 
  restrict_public_buckets = true
}

