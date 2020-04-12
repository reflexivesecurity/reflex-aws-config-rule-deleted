module "reflex_aws_config_rule_deleted" {
  source           = "git::https://github.com/cloudmitigator/reflex-engine.git//modules/cwe_lambda?ref=v0.5.8"
  rule_name        = "ConfigRuleDeleted"
  rule_description = "Detects the deletion of AWS Config Rules"

  event_pattern = <<PATTERN
{
  "source": [
    "aws.config"
  ],
  "detail-type": [
    "AWS API Call via CloudTrail"
  ],
  "detail": {
    "eventSource": [
      "config.amazonaws.com"
    ],
    "eventName": [
      "DeleteConfigRule"
    ]
  }
}
PATTERN

  function_name   = "ConfigRuleDeleted"
  source_code_dir = "${path.module}/source"
  handler         = "reflex_aws_config_rule_deleted.lambda_handler"
  lambda_runtime  = "python3.7"
  environment_variable_map = {
    SNS_TOPIC = var.sns_topic_arn,
    
  }

  queue_name    = "ConfigRuleDeleted"
  delay_seconds = 0

  target_id = "ConfigRuleDeleted"

  sns_topic_arn  = var.sns_topic_arn
  sqs_kms_key_id = var.reflex_kms_key_id
}
