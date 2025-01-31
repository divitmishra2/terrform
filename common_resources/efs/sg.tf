# Defining the Security Group
resource "aws_security_group" "efs_sg" {
  vpc_id = "${var.vpc_id}"
  name   = "${var.efs_sg_name}"

 # Allow all outbound traffic.
  egress {
	protocol    = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    protocol    = "tcp"
    from_port   = 2049    # Edit the port number as required
    to_port     = 2049  # Edit the port number as required
    cidr_blocks = ["10.0.0.0/8"] 
	#security_groups = ["PROVIDE SG ID"]
  }


  # Add more ingress rules and egress rules as required

  tags = "${merge(var.default_tags, map("Name",var.efs_sg_name), var.tags)}"
}

output "sg_id" {
  value = "${aws_security_group.efs_sg.id}"
}