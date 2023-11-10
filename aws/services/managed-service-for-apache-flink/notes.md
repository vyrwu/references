# Managed Service for Apache Flink

Framework for processing data streams (that's how Kinesis Data Analytics works).

Integrates Flink with AWS. Loads Flink app (Java/Python/Scala) from S3 to MSF.

Supports:

- DataStream API
- Table API for SQL -> likely successor to Kinesis Data Analytics.

## Use Cases

- Serverless Streaming ETL
- Real-Time Analytics

## Flink Sources

- Kinesis Data Streams
- Managed Service for Apache Kafka (MSK)

## Flink Sinks

- Kinesis Data Streams/Firehose
- Amazon S3
