# Kinesis
Kinesis is a streaming platform consisting of multiple AWS products, allowing customers to rapidly collect, process, analyze and store large amount of real-time streaming data. Typical use-cases are sending large amounts of real-time data for analysis, f.x. page clicks, IOT device data points, video data stream ingest, real-time dashboard data, marketing and social media feeds, application logs etc.

Data can be feed into a data warehouse or a map-reduce cluster.

Part of AWS offerings for Big Data use cases.

## Kinesis Data Streams
Collects and processes large streams of record data in real time. Applications can use Kinesis Client Library to access data streams as data records.

## Kinesis Data Firehose
Reads Data Streams and delivers the data into a destination like Amazon S3, Redshift, OpenSearch Service, or Splunk. Supports any custom HTTP endpoint (including third-party), f.x. Datadog, MongoDB or New Relic. Additionally, can transform the data records and convert the record format to fit the destination.

## Kinesis Data Analytics
Allows to process and analyse data in Kinesis Data Stream using SQL/Java/Scala. Can enrich the data, aggregate data over time, or find anomalies, and write results back into the Data Stream, or send it to the Data Firehose destination. Alternatively, feed it into a Lambda function. 

## Kinesis Video Streams
AWS managed service to stream live video from devices to AWS cloud, or build apps for real-time video processing or batch-oriented video applications. Common use case is to manage video live streams for entertainment, security, scientific, machine learning or business purposes. It can also process non-video time-serialized data such as thermal imagery, depth data, RADAR data, and more.

Can be configured to retain the data, and store it encrypted at rest. 
