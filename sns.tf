resource "aws_sns_topic" "sns_topic_example" {
  name = "${var.project}_topic${var.fifo ? ".fifo" : ""}"
  fifo_topic = var.fifo
}

