variable "log_destination" {
  description = "The ARN of the IAM role that posts logs to CloudWatch Logs"
}
variable "traffic_type" {
  description = "Tipo di traffico: ACCEPT, REJECT, ALL."
}