# Config

AWS Resource configuration management service. Maintains a historical record of all configuration changes made to resources created in 
the AWS account. The historical records are written to S3.

Has integration with SQS/SNS/EventBridge.

## Rules
AWS Config can not only track changes to resources, but also evaluate wether those changes violate any of the defined configuration rules set for the account. If a resource violates the rule, it is flagged as non-compliant. Rules are extremely flexible and can be used to create detailed and accurate guardrails for the usage of the account, flagging compliance violations.

## Triggers
Can be "configuration changes" or "periodic".

