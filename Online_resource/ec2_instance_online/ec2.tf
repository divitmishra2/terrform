# Defining the EC2
resource "aws_instance" "ec2_instance" {
  ami                          = "${var.ami_id}" # Use the latest version of the Golden image and please do not use Marketplace images
  availability_zone            = "${var.avb_zone}"
  instance_type                = "${var.instance_type}"
  subnet_id                    = "${var.subnet_id}"
  key_name                     = "${var.key_name}"
  iam_instance_profile         = "PROVIDE NAME"
  vpc_security_group_ids = [var.sg_ids]
  user_data = "${file("../ec2_instance_online/user_data_file.sh")}"	###User data to resize the root volume
  disable_api_termination      = "true"
  tags                         = "${merge(var.default_tags, map("Name",var.ec2_name),var.tags)}"
  volume_tags = "${merge(var.default_tags, map("Name",var.ec2_name),var.tags)}"


	root_block_device {
          volume_size           = 40
          volume_type           = "gp2"
		  encrypted				= "true"
		  kms_key_id 			= "${var.kms_key_arn}"
		  }
}

output "ec2_id" {
  value = "${aws_instance.ec2_instance.id}"
}

output "ec2_instance_type" {
   value = "${aws_instance.ec2_instance.instance_type}"
   }

output "ec2_ami_id" {
   value = "${aws_instance.ec2_instance.ami}"
   }