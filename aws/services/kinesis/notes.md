# Kinesis

Kinesis is a streaming platform consisting of multiple AWS products, allowing
customers to rapidly collect, process, analyze and store large amount of
real-time streaming data. Typical use-cases are sending large amounts of
real-time data for analysis, f.x. page clicks, IOT device data points, video
data stream ingest, real-time dashboard data, marketing and social media feeds,
application logs etc.

Data can be feed into a data warehouse or a map-reduce cluster.

Part of AWS offerings for Big Data use cases.

AWS-managed alternative to Apache Kafka. Integrated with stream processing
frameworks (Spark/NiFi/...).

Data is replicated onto 3 AZs.

## Kinesis Data Streams

Collects and processes large streams of record data in real time. Applications
can use Kinesis Client Library to access data streams as data records.

Low latency ingest at scale.

Streams are divided into ordered Shards/Partitions.

Data is immutable (cannot be deleted once injested).

Default retention: 24h, can be increased up to 365 days. Data can be replayed.

Multiple consumers can consume the same shard.

Records are up to 1MB in size - not good for peta-byte scale batch analysis.

Used to create real-time applications:

- Classic: ~200ms
- Enchanced fan-out: ~70ms

### Capacity Modes

- Provisioned (when knowing capacity in advance)
  - choose how many shards
  - each 1MB/s in, 2MB/s out
  - Billing: shard/hour
- On-demand (when not knowing capacity in advance)
  - Auto-scaled (30d throughput peak; default 4MB/s or 4000 records/s)
  - Billing: stream/hour + data in/out in GB

### Shard Limits

Producer: 1MB/s or 1000 records/s write per single consumer, otherwise
`ProvisionedThroughputException`.

- Consumer (Classic): 2MB/s or 2000 records/s read ALL consumers
- Consumer (Classic): 5 API calls/s read ALL consumers

By default, Lambda provisions one function per shard. This can be increased by
tweaking parallelisation settings.

Throughput as always shared across all consumers - unless your consumer is
registered for "enchanced fan-out", which assigns a dedicated throughput to it.

## Kinesis Data Firehose

Reads Data Streams and delivers the data into a destination like Amazon S3,
Redshift, OpenSearch Service, or Splunk. Supports any custom HTTP endpoint
(including third-party), f.x. Datadog, MongoDB or New Relic. Additionally, can
transform the data records and convert the record format to fit the destination.

Ingest stream data into AWS destinations, 3rd party partner integrations, or
custom destinations.

NOT REAL TIME, Near real-time (1min latency minimum for non-full batches).

### Transformations

Ingested data can be transformed before it is written to the destination via AWS
Lambda (f.x. from CSV to JSON). Several "blueprints" available.

- supports compression (GZIP, ZIP, SNAPPY)
- pay per use (amount of data going through Firehose)

For S3 data source, JSON data can be auto-converted to Parquet or ORC.

### Ingest from

- Kinesis Data Streams
- Amazon CloudWatch (logs&events)
- AWS IOT

### Loading

Loads in batches.

- S3
- Redshift (copy through S3)
- ElasticSearch (OpenSearch)
- 3rd party (Datadog, MongoDB, NewRelic, Splunk)
- custom HTTP destination

#### Buffer

Buffer size and interval are configurable.

- Buffer size
  - Min. 1MB
  - Higher buffer size = higher latency, lower cost
  - Lower buffer size = lower latency, higher cost
- Buffer interval
  - Min. 60s
  - Higher interval = more data accumulated, bigger batches
  - Lower interval = higher data frequency, good for short data cycles

#### Error handling

Can send data to S3 in case of failure.

- source records
- transformation failures
- delivery failures

#### Encryption

- AWS managed CMK (S3-managed key)
- Customer managed CMK

#### Compression

- GZIP
- SNAPPY (Normal and Hadoop-compatible)
- ZIP

## Kinesis Data Analytics

Serverless service that performs real-time data analytics on stream data.

Takes input stream and runs SQL/Flink query on it. Writes result back to another
stream. Can use reference data from S3 to join data via query.

Uses IAM to access source/destination streams.

### Inputs

- Kinesis Data Stream
- Kinesis Data Firehose destination
- (Optional) Reference data in S3

### Outputs

- Kinesis Data Stream
- Kinesis Data Firehose
- (Optional) Error Stream

### Provided SQL functions

- RANDOM_CUT_FOREST: find data outliers and anomalies
- HOTSPOTS: find trends and dense data regions

### Use cases

- Streaming ETL: select columns, simple transformations, on streams
- Real-Time Metrics: gaming, leaderboards, stock tickers, sensor data
- Responsive Analytics: alerting, anomaly detection, trends

## Kinesis Video Streams

Stream live video from devices to AWS cloud, or build apps for real-time video
processing or batch-oriented video applications.

Support live feed (video playback).

Data retention: 1d to 10y.

## Producers

One producer per video stream.

- cameras
- images
- audio
- RADAR data
- RTSP cameras
- AWS DeepLens

## Consumers

- own consumers (Tensorflow, MXNet)
- AWS SageMaker
- Amazon Rekognition Video

Common use case is to manage video live streams for entertainment, security,
scientific, machine learning or business purposes. It can also process non-video
time-serialized data such as thermal imagery, depth data, RADAR data, and more.

## Use cases

1. App receives ProvisionedThroughputExceededException on Kinesis Data Stream
   read. How to resolve this?
   - Add more shards to the Data Stream to increase throughput.
   - Have Consumers retry on the error
   - Consider switching to On-Demand Capacity Mode
