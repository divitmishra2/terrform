# Defining the Security Group

resource "aws_security_group" "lb-sg" {
  vpc_id = "${var.vpc_id}"
  name   = "${var.alb_sg_name}"

 # Allow all outbound traffic.  
   
egress {
	protocol    = "TCP"
    from_port = 8080
	to_port     = 8080
	cidr_blocks = ["10.0.0.0/8"]
    #security_groups = ["PROVIDE SG ID"]
	description = "EC2 Load Balencer SG"
  }
/*  
egress {
	protocol    = "TCP"
    from_port = 8080
	to_port     = 8080
   cidr_blocks = ["10.0.0.0/8"]
   # security_groups = ["PROVIDE SG ID"]
	description = "Public ec2"
  }  

  egress {
	protocol    = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
 */ 
# Allow inbound traffic.  
  
   ingress {
    protocol    = "tcp"
    from_port   = 443    # Edit the port number as required
    to_port     = 443   # Edit the port number as required
    cidr_blocks = ["10.0.0.0/8"]
	description = "HTTPS"
  }
# Allow inbound traffic.  
  
   ingress {
    protocol    = "tcp"
    from_port   = 80    # Edit the port number as required
    to_port     = 80   # Edit the port number as required
    cidr_blocks = ["10.0.0.0/8"]
	description = "HTTP"
  }

  # Add more ingress rules and egress rules as required

  tags = "${merge(var.default_tags, map("Name",var.alb_sg_name), var.tags)}"
}

output "sg_id" {
  value = "${aws_security_group.lb-sg.id}"
}