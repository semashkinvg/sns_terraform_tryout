
resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn      = aws_sns_topic.sns_topic_example.arn
  protocol       = "sqs"
  endpoint       = "${aws_sqs_queue.sqs_example.arn}"
  redrive_policy = "{\"deadLetterTargetArn\": \"${aws_sqs_queue.sqs_example_deadletter.arn}\"}"
  # redrive_policy = "{\"deadLetterTargetArn\": \"${aws_sqs_queue.sqs_example_deadletter.arn}_not_existing\"}"
}

