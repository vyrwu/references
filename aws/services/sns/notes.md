# SNS (Simple Notification Service)

Cloud-hosted message delivery service, allowing users to send notifications from cloud. Messages are delivered from producers to consumers. Publishers publish messages on a topic. Client apps subscribe to the topic, and receive messages using one of supported endpoint types.

SNS decouples message consumers and producers in an asynchronous architecture.

Up to 10mil subscribers. Good when pushing messages to many subscribers. Can integrate with SQS for fan-out architecture pattern.

Push-based model (SNS topic pushes messages to subscribers).
## Endpoint Types

### Application-to-Application subscribers
- Amazon Kinesis Firehose
- Amazon SQS
- AWS Lambda
- HTTPS endpoint

### Application-to-person subscribers
- SMS
- Email
- Push Notifications

## FIFO topics
SNS supports FIFO topics for strict message ordering and duplication prevention. Only SQS FIFO queue can subscribe to the SNS FIFO topic.

## Encryption
Server-side encryption at rest using encryption keys provided by AWS KMS for SNS topic messages.

## Persistence
Data is not persisted (lost if not deleted). 
