# SQS (Simple Queue Service)

AWS-hosted queue web service. Designed to decouple distributed systems and components.

Nearly unlimited throughput.

Usecases like:
- decoupling liver user requests from backend processing, like image editting and encoding.
- processing large number of credit card validations
- batching of messages to be added to a database

## Queue Types

### Standard (Default)
Almost unlimited TPS.

At-least-once delivery (might deliver duplicates).

Best-effort message ordering, but no guarantees.

### FIFO
Limited TPS (transactions per second).

Exactly-once delivery (no duplicates).

Strict message ordering (message groups for multiple ordered streams within a single queue).

## DQL (Dead-letter Queues)
Side-queue to the primary SQS queue which holds messages that can't be consumed. Isolates bad messages for debugging. Messages can be fed back into the primary queue once debugging is over via SQS DQL redrive policies.

Alarms can be set on any unprocessed messages once they land in DQL.

Always use DQL for Standard Queues. Helps to prevent poison-pills (consumable, but unprocessable messages).

Never use DQL for FIFO queues, unles it's OK to stop processing until the message is redrove.

If message can be retried indefinitely, don't use DQL.
