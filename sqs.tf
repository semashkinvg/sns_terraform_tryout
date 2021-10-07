
data "aws_iam_policy_document" "sqs_policy_main" {
  statement {
    actions = ["SQS:SendMessage"]
    effect = "Allow"
    resources = [ "*"]

    principals {
      type        = "Service"
      identifiers = ["sns.amazonaws.com"]
    }

    condition {
        test = "ArnEquals"
        variable = "aws:SourceArn"
        values = [aws_sns_topic.sns_topic_example.arn]
    }
  }
}

resource "aws_sqs_queue" "sqs_example" {
  name       = "${var.project}-example-queue"
  # this is why messsages sent to the dead letter queue
#   policy = data.aws_iam_policy_document.sqs_policy_main.json
}

resource "aws_sqs_queue" "sqs_example_deadletter" {
  name       = "${var.project}-example-queue_deadletter"
  policy = data.aws_iam_policy_document.sqs_policy_main.json
}
