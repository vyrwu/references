# Kinesis

Kinesis is a streaming platform consisting of multiple AWS products,
allowing customers to rapidly collect, process, analyze and store large
amount of real-time streaming data. Typical use-cases are sending large
amounts of real-time data for analysis, f.x. page clicks, IOT device
data points, video data stream ingest, real-time dashboard data,
marketing and social media feeds, application logs etc.

Data can be feed into a data warehouse or a map-reduce cluster.

Part of AWS offerings for Big Data use cases.

AWS-managed alternative to Apache Kafka. Integrated with stream
processing frameworks (Spark/NiFi/...).

Data is replicated onto 3 AZs.

## Kinesis Data Streams

Collects and processes large streams of record data in real time.
Applications can use Kinesis Client Library to access data streams as
data records.

Low latency ingest at scale.

Streams are divided into ordered Shards/Partitions.

Data is immutable (cannot be deleted once injested).

Default retention: 24h, can be increased up to 365 days. Data can be 
replayed.

Multiple consumers can consume the same shard.

Records are up to 1MB in size - not good for peta-byte scale batch
analysis.

Used to create reat-time applications:

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

Consumer (Classic): 2MB/s or 2000 records/s read ALL consumers
Consumer (Classic): 5 API calls/s read ALL consumers


## Kinesis Data Analytics

Allows to process and analyse data in Kinesis Data Stream using
SQL/Java/Scala. Can enrich the data, aggregate data over time, or find
anomalies, and write results back into the Data Stream, or send it to
the Data Firehose destination. Alternatively, feed it into a Lambda
function.

Real-time stream analytics with SQL.

## Kinesis Data Firehose

Reads Data Streams and delivers the data into a destination like Amazon
S3, Redshift, OpenSearch Service, or Splunk. Supports any custom HTTP
endpoint (including third-party), f.x. Datadog, MongoDB or New Relic.
Additionally, can transform the data records and convert the record
format to fit the destination.

Ingest stream data into AWS destinations, 3rd party partner
integrations, or custom destinations.

NOT REAL TIME, Near real-time (1min latency minimum for non-full batches).

- from CSV/JSON to Parquet/ORC (S3 only)
- transformation via Lambda (f.x. CSV to JSON)
- supports compression (GZIP, ZIP, SNAPPY)
- pay per use (amount of data going through Firehose)

Reads from:

- Kinesis Data Streams
- Amazon CloudWatch (logs&events)
- AWS IOT

Can transform the data via Lambda (several "blueprints" available).

Batch writes data into:

- S3
- Redshift (copy through S3)
- ElasticSearch (OpenSearch)
- 3rd party (Datadog, MongoDB, NewRelic, Splunk)
- custom HTTP destination

Can send data to S3 in case of failure.

- source records
- transformation failures
- delivery failures

## Kinesis Video Streams

AWS managed service to stream live video from devices to AWS cloud, or
build apps for real-time video processing or batch-oriented video
applications. Common use case is to manage video live streams for
entertainment, security, scientific, machine learning or business
purposes. It can also process non-video time-serialized data such as
thermal imagery, depth data, RADAR data, and more.

Can be configured to retain the data, and store it encrypted at rest.

For streaming, real-time data.
