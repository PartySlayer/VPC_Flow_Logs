resource "aws_cloudwatch_log_group" "vpc_flow_logs_group" {
  name = module.vpc.name-log_group
}

resource "aws_cloudwatch_metric_filter" "vpc_flow_logs_non_admin_filter" {
  name           = "vpc-flow-logs-non-admin-filter" 
  pattern        = "{$.action = REJECT, $.dstport = 22}" 
  log_group_name = aws_cloudwatch_log_group.vpc_flow_logs_group.name

  metric_transformation {
    name      = "NonAdminRejectCount"
    namespace = "CustomNamespace"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "vpc_flow_logs_non_admin_alarm" {
  alarm_name          = "NonAdminAccess"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "NonAdminRejectCount"
  namespace           = "CustomNamespace"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1" 
  alarm_description   = "Alarm when VPC flow logs receive at least one reject on ssh access"
  alarm_actions       = [var.sns_topic_arn]  
  }
