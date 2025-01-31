# Define application load balancer
resource "aws_lb"{
  name               = "${var.lb_name}"  
  internal           = true
  load_balancer_type = "application"                      # Type of the Load balancer
  security_groups    = ["${aws_security_group.lb-sg.id}"] # Security groups to be associated with the load balancer
  subnets            = "${var.subnet_ids}"     # Subnets to be associated with the Load balancer
  idle_timeout  = 300
  access_logs {
		bucket  = "${var.s3_bucket_name}"
		enabled = true 
		prefix  = "${var.bucket_prefix}"
    }
  tags               = "${merge(var.default_tags, map("Name",var.lb_name), var.tags)}"
}

# Define the load balancer listener
resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = "${aws_lb.arn}"
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.alb_tg.arn}"
  }
}

# listener ssl
/*
resource "aws_lb_listener" "lb_ssl_listener" {
  load_balancer_arn = "${aws_lb.arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "PROVIDE ARN"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.alb_tg.arn}"
  }
}
*/
# Define the Load balancer target group
resource "aws_lb_target_group" "alb_tg" {
  name     = "${var.tg_name}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"
  tags     = "${merge(var.default_tags, map("Name",var.tg_name), var.tags)}"
}

############ extra target group for rule ########

# Define the Load balancer target group
resource "aws_lb_target_group" "alb_tg1" {
  name     = "${var.tg_name1}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"
  tags     = "${merge(var.default_tags, map("Name",var.tg_name1 ), var.tags)}"
}

## Attach the instance to Targer Group
resource "aws_lb_target_group_attachment" "attach_instance1" {
#	count = length("${var.inst_id1}")
  target_group_arn = "${aws_lb_target_group.alb_tg1.arn}"
  target_id        = "PROVIDE INSTANCEX ID"
#  target_id1        = 
  port             = "${var.target_port}"
}

resource "aws_lb_target_group_attachment" "attach_instance2" {
#	count = length("${var.inst_id1}")
  target_group_arn = "${aws_lb_target_group.alb_tg1.arn}"
  target_id        = "PROVIDE INSTANCEX ID"
#  target_id1        = 
  port             = "${var.target_port}"
}

## Attach the instance to Targer Group
resource "aws_lb_target_group_attachment" "attach_instance" {
	count = length("${var.inst_id}")
  target_group_arn = "${aws_lb_target_group.alb_tg.arn}"
  target_id        = "${var.inst_id[count.index]}"  
  port             = "${var.target_port}"
}

output "alb_id" {
  value = "${aws_lb.id}"
}

output "alb_target_id" {
  value = "${aws_lb_target_group.alb_tg.id}"
}

output "alb_id_suffix" {
  value = "${aws_lb.arn_suffix}"
}
output "alb_target_id_suffix" {
  value = "${aws_lb_target_group.alb_tg.arn_suffix}"
}