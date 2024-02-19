resource "aws_sns_topic" "reject_ssh" {
  name = "reject ssh"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  provider = main.provider

  topic_arn = aws_sns_topic.reject_ssh.arn
  protocol  = "email"
  endpoint  = var.email_sns
}


