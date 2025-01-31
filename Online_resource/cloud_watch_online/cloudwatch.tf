/*
## CloudWatch Log Group
resource "aws_cloudwatch_log_group" "log_group" {
  name = "${var.log_group_name}"
  retention_in_days = "${var.retention_in_days}"
  tags      = "${merge(var.default_tags, map("Name",var.log_group_name),var.tags)}"
  
}
*/
#Disk space utilization alarms

resource "aws_cloudwatch_metric_alarm" "Cloudwatchalarm_diskutilization_P1" {

  count = length("${var.inst_id}")
  alarm_name                = "${var.alarm_name_disk_p1[count.index]}"
  actions_enabled			= "${var.actions_enabled}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "${var.evaluation_periods}"
  metric_name               = "disk_used_percent"
  namespace                 = "CWAgent"
  period                    = "${var.period}"
  statistic                 = "Average"
  datapoints_to_alarm       = "2"
  threshold					= "${var.threshold_value_p1}"
  alarm_description         = "${var.alarm_disk_p1}" 
  alarm_actions             =  ["${var.snsarn}"]
  
  dimensions = {
        path = "/"
        device ="nvme0n1p2"
        InstanceId = "${var.inst_id[count.index]}" 
        fstype = "xfs"
        ImageId = "${var.image_id[count.index]}"
        InstanceType = "${var.instance_type[count.index]}"
        
  } 

  insufficient_data_actions = []
  tags                     = "${merge(var.default_tags, map("Name",var.alarm_name_disk_p1[count.index]),var.tags)}"
}

resource "aws_cloudwatch_metric_alarm" "Cloudwatchalarm_diskutilization_P2" {

  count = length("${var.inst_id}")
  alarm_name                = "${var.alarm_name_disk_p2[count.index]}"
  actions_enabled			= "${var.actions_enabled}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "${var.evaluation_periods}"
  metric_name               = "disk_used_percent"
  namespace                 = "CWAgent"
  period                    = "${var.period}"
  statistic                 = "Average"
  datapoints_to_alarm       = "2"
  threshold					= "${var.threshold_value_p2}"
  alarm_description         = "${var.alarm_disk_p2}" 
  alarm_actions             =  ["${var.snsarn}"]
  
  dimensions = {
        path = "/"
        device ="nvme0n1p2"
        InstanceId = "${var.inst_id[count.index]}" 
        fstype = "xfs"
        ImageId = "${var.image_id[count.index]}"
        InstanceType = "${var.instance_type[count.index]}"
        
  } 

  insufficient_data_actions = []
  tags                     = "${merge(var.default_tags, map("Name",var.alarm_name_disk_p2[count.index]),var.tags)}"
}


### CPU Utilization Alarm
resource "aws_cloudwatch_metric_alarm" "Cloudwatchalarm_cpuutilization_P1" {
  
  count = length("${var.inst_id}")
  actions_enabled			= "${var.actions_enabled}"
  alarm_name                = "${var.alarm_name_cpu_p1[count.index]}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "${var.evaluation_periods}"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "${var.period}"
  statistic                 = "Average"
  #datapoints_to_alarm       = "2"
  threshold					= "${var.threshold_value_p1}"
  alarm_description         = "${var.alarm_cpu_p1}"
  alarm_actions             =  ["${var.snsarn}"]
  dimensions = {      
		InstanceId = "${var.inst_id[count.index]}" 
		}
		
  insufficient_data_actions = []
  tags                     = "${merge(var.default_tags, map("Name",var.alarm_name_cpu_p1[count.index]),var.tags)}"
}

resource "aws_cloudwatch_metric_alarm" "Cloudwatchalarm_cpuutilization_P2" {
  
  count = length("${var.inst_id}")
  actions_enabled			= "${var.actions_enabled}"
  alarm_name                = "${var.alarm_name_cpu_p2[count.index]}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "${var.evaluation_periods}"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "${var.period}"
  statistic                 = "Average"
  #datapoints_to_alarm       = "2"
  threshold					= "${var.threshold_value_p2}"
  alarm_description         = "${var.alarm_cpu_p2}"
  alarm_actions             =  ["${var.snsarn}"]
  dimensions = {      
		InstanceId = "${var.inst_id[count.index]}" 
		}
		
  insufficient_data_actions = []
  tags                     = "${merge(var.default_tags, map("Name",var.alarm_name_cpu_p2[count.index]),var.tags)}"
}


#memory utilization alarms
resource "aws_cloudwatch_metric_alarm" "Cloudwatchalarm_memoryutilization_P1" {

  count = length("${var.inst_id}")
  actions_enabled			= "${var.actions_enabled}"
  alarm_name                = "${var.alarm_name_memory_p1[count.index]}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "${var.evaluation_periods}"
  metric_name               = "mem_used_percent"
  namespace                 = "CWAgent"
  period                    = "${var.period}"
  statistic                 = "Average"
  datapoints_to_alarm       = "2"
  threshold                 = "${var.threshold_value_p1}"
  alarm_description         = "${var.alarm_memory_p1}"
  alarm_actions             =  ["${var.snsarn}"]
  dimensions = {

      InstanceId = "${var.inst_id[count.index]}" 
	  ImageId = "${var.image_id[count.index]}"
      InstanceType = "${var.instance_type[count.index]}"
  } 

  insufficient_data_actions = []
  tags                     = "${merge(var.default_tags, map("Name",var.alarm_name_memory_p1[count.index]),var.tags)}"
}

resource "aws_cloudwatch_metric_alarm" "Cloudwatchalarm_memoryutilization_P2" {

  count = length("${var.inst_id}")
  actions_enabled			= "${var.actions_enabled}"
  alarm_name                = "${var.alarm_name_memory_p2[count.index]}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "${var.evaluation_periods}"
  metric_name               = "mem_used_percent"
  namespace                 = "CWAgent"
  period                    = "${var.period}"
  statistic                 = "Average"
  datapoints_to_alarm       = "2"
  threshold                 = "${var.threshold_value_p2}"
  alarm_description         = "${var.alarm_memory_p2}"
  alarm_actions             =  ["${var.snsarn}"]
  dimensions = {

      InstanceId = "${var.inst_id[count.index]}" 
	  ImageId = "${var.image_id[count.index]}"
      InstanceType = "${var.instance_type[count.index]}"
  } 

  insufficient_data_actions = []
  tags                     = "${merge(var.default_tags, map("Name",var.alarm_name_memory_p2[count.index]),var.tags)}"
}

#cloudwatch alarm for ALB Target unhealthy host

resource "aws_cloudwatch_metric_alarm" "Cloudwatchalarm_alb_p1" {
   count = length("${var.alb_name}")
 actions_enabled			= "${var.actions_enabled}"
  alarm_name          = "${var.alarm_name_alb_p1[count.index]}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "${var.evaluation_periods}"
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = "300"
  statistic           = "Average"
  threshold           = "${var.alb_threshold_value_p1}"
  alarm_description   = "${var.alarm_alb_p1}"
  
  alarm_actions       = ["${var.snsarn}"]
  datapoints_to_alarm = "2"
  dimensions = {
    TargetGroup  = "${var.target_group[count.index]}"
    LoadBalancer = "${var.alb_name[count.index]}"
  }
  tags = "${merge(var.default_tags, map("Name",var.alarm_name_alb_p1[count.index]),var.tags)}"
}


resource "aws_cloudwatch_metric_alarm" "Cloudwatchalarm_alb_p2" {
    count = length("${var.alb_name}")
	
  actions_enabled			= "${var.actions_enabled}"
  alarm_name          = "${var.alarm_name_alb_p2[count.index]}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "${var.evaluation_periods}"
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = "300"
  statistic           = "Average"
  threshold           = "${var.alb_threshold_value_p2}"
  alarm_description   = "${var.alarm_alb_p2}"
  
  alarm_actions       = ["${var.snsarn}"]
  datapoints_to_alarm = "2"
  dimensions = {
    TargetGroup  = "${var.target_group[count.index]}"
    LoadBalancer = "${var.alb_name[count.index]}"
  }
  tags = "${merge(var.default_tags, map("Name",var.alarm_name_alb_p2[count.index]),var.tags)}"
}






