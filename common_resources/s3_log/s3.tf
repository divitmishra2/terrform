
# Define S3 bucket for application logs

resource "aws_s3_bucket" "log_bucket" {
  bucket = "${var.bucket_name}"
  acl    = "private"
  tags   = "${merge(var.default_tags, map("Name",var.bucket_name), var.tags)}"
  lifecycle_rule {
    id      = "log"
    enabled = true

    prefix = "log/"
	
	tags = {
      "rule"      = "log"
      "autoclean" = "true"
    }
    
    expiration {
      days = 30
    }
  }
   server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }

}


resource "aws_s3_bucket_policy" "Bucket_policy" {
  bucket = "${aws_s3_bucket.log_bucket.id}"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "AWSConsole-AccessLogs-Policy-1595503125009",
    "Statement": [
        {
            "Sid": "AWSConsoleStmt-1595503125009",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::156460612806:root"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.bucket_name}/*"
        },
        {
            "Sid": "AWSLogDeliveryWrite",
            "Effect": "Allow",
            "Principal": {
                "Service": "delivery.logs.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.bucket_name}/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        },
        {
            "Sid": "AWSLogDeliveryAclCheck",
            "Effect": "Allow",
            "Principal": {
                "Service": ["delivery.logs.amazonaws.com", "logs.eu-west-1.amazonaws.com"]
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::${var.bucket_name}"
        },
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "logs.eu-west-1.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.bucket_name}/*"
        }
    ]
}

POLICY
}


resource "aws_s3_bucket_public_access_block" "Public_access" {
	depends_on = [aws_s3_bucket_policy.Bucket_policy]
  bucket = "${aws_s3_bucket.log_bucket.id}"

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true 
  restrict_public_buckets = true
}

output "s3_bucket" {
  depends_on = [aws_s3_bucket_public_access_block.Public_access]
  value = "${aws_s3_bucket.log_bucket.id}"
}