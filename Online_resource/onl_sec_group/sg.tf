# Defining the Security Group

resource "aws_security_group" {
  vpc_id = "${var.vpc_id}"
  name   = "${var.sg_name}"
  description = "${var.describ}" 	## Change as per application

 # Allow all outbound traffic.
  egress {
	protocol    = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
 
 # Allow the Inbound traffic

  ingress {
    protocol    = "tcp"
    from_port   = 22    # Edit the port number as required
    to_port     = 22  # Edit the port number as required
    cidr_blocks = ["PROVIDE IP"]
	description = "Tool Server"
  }

   ingress {
    protocol    = "tcp"
    from_port   = 22    # Edit the port number as required
    to_port     = 22  # Edit the port number as required
    cidr_blocks = ["PROVIDE NAME"]
	description = "PROVIDE NAME"
  }
    ingress {
    protocol    = "tcp"
    from_port   = 8080    # Edit the port number as required
    to_port     = 8080  # Edit the port number as required
    cidr_blocks = ["PROVIDE IP"]
	description = "PROVIDE NAME"
  }

    ingress {
    protocol    = "tcp"
    from_port   = 8080    # Edit the port number as required
    to_port     = 8080  # Edit the port number as required
	cidr_blocks = ["10.0.0.0/8"]
    #security_groups = ["PROVIDE SG ID"]
	description = "App Load Balencer SG"
  }

  # Add more ingress rules and egress rules as required

  tags = "${merge(var.default_tags, map("Name",var.sg_name),var.tags)}"
}

output "sec_ids" {
  value = "${aws_security_group.id}"
}