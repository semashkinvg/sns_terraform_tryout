resource "aws_sns_topic" "sns_topic_example" {
  name = "${var.project}_topic"
}

