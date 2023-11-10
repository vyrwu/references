# SQS (Simple Queue Service)

AWS-hosted queue web service. Designed to decouple distributed systems
and components.

Nearly unlimited throughput.

Usecases like:

- decoupling liver user requests from backend processing, like image
  editting and encoding.
- processing large number of credit card validations
- batching of messages to be added to a database

Pull-based model (clients poll queues for available messages).

Priority-based processing should be designed by creating more queues.

## Queue Types

### Standard (Default)

Almost unlimited TPS.

At-least-once delivery (might deliver duplicates).

Best-effort message ordering, but no guarantees.

### FIFO

Limited TPS (transactions per second).

Exactly-once delivery (no duplicates).

Strict message ordering (message groups for multiple ordered streams
within a single queue).

## DQL (Dead-letter Queues)

Side-queue to the primary SQS queue which holds messages that can't be
consumed. Isolates bad messages for debugging. Messages can be fed
back into the primary queue once debugging is over via SQS DQL redrive
policies.

Alarms can be set on any unprocessed messages once they land in DQL.

Always use DQL for Standard Queues. Helps to prevent poison-pills
(consumable, but unprocessable messages).

Never use DQL for FIFO queues, unles it's OK to stop processing until
the message is driven back.

If message can be retried indefinitely, don't use DQL.

## Long Polling

Clients can poll for messages in the queue. Applications can configure
a poll duration, which controls how long the requests are held by AWS
SQS waiting for available messages before returning a response.

- Long polling = long wait, less requests
- Short polling = short wait, more requests

Fine-tuning poll duration against SQS message frequency is a common
strategy for lowering cost in decoupled architectures. For example,
short polling on a low-activity queue results in a lot of wasteful
polling requests that return nothing.

## Message Visibility

When message arrives to SQS, it becomes "visible" for clients. SQS
will offers it to polling apps. When message gets offered to an app,
it becomes "hidden". The app can then consume the message, which will
delete it from the queue. If message is offered to the app, but never
consumed because of some failure, message becomes available again
after the visibility timeout period so it can be reprocessed by other
consumers.

If a consumer receives a message, processes it, but does not consume,
the message will be offered to other consumers and will be processed
twice. If DLQ is configured, it will receive the message instead.
Then, DLQ redrive policy controls whether it gets back into the queue
again.

If consumer receives a message, and despite failing to process it,
will consume it, messages will be disappearing from the queue without
processing.

## Monitoring

CloudWatch metrics.

## Message Deletion

Messages can be deleted from the SQS queue in the following ways:

- DeleteMessage API on a message has been called.
- `maxRecieveCount` has been reached, which tells SQS how many times a
  message is allowed to be re-consumed before it is deleted/moved to
  DLQ.
- The queue is is purged.
-
