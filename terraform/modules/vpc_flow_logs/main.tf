resource "aws_flow_log" "vpc_flow_logs" {
  depends_on       = [aws_vpc.main]
  log_destination  = var.log_destination
  traffic_type     = var.traffic_type
  vpc_id           = module.vpc.vpc_id
}