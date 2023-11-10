# AWS Glue

Consolidates data integration workloads into a single service. Connect
70+ data sources into a single data catalogue. Supports:

- ETL
- ELT
- Streaming

## AWS Glue Data Catalogue

Metadata repository for all tables.

### Schemas

Features automatic schema inference + schemas are versioned.

### Crawlers

Can crawl a data source (table, S3 bucket, etc.) and figure out data
schemas and partitions. Help build the Data Catalogue. Works for many
data types (JSON, Parquet, CSV, SQL), and data sources (RDS, S3,
Redshift).

Can auto-detect partitions and data types.

Can be run on-schedule/on-demand.

### Integrations

The inferred data schemas can be used to query and analyse data via:

- AWS Athena
- AWS Redshift Spectrum
- AWS EMR

## Glue ETL

Fully managed, serverless Spark platform for running ETL jobs.
Generate Glue ETL code in Python/Scala, or provide own Spark/PySpark
script. Targets can be S3/JDBC(RDS/Redshift)/Glue Data Catalogue.

### Schedules

Trigger ETL jobs based on schedule.

### Triggers

Trigger ETL jobs based on events happening.

### Transformations

- Bundled:
  - DropFields/DropNullFields (scope or clean-up data)
  - Filter (filter records)
  - Join (enrich data)
  - Map (add fields, remove fields, perform external lookups)
- ML Transformations:
  - FindMatchesML (find duplicates or matching records in data set,
    event when there's no common identifier or fields do not match
    exactly)
- Format conversion:
  - CSV
  - JSON
  - XML
  - Parquet
  - ORC
  - AVRO
- Apache Spark:
  - K-Means

### Use cases

Good for pre-analysis data manipulation/clean-up/enrichment.

- Transform Data
- Enrich Data
- Clean Data

## S3 Data Lake

Allows to integrate data from various sources into an S3 Data Lake,
and then automatically query using Athena/Redshift Spectrum/EMR.

## Glue Studio

UI on top of Glue that visualizes the data integration workflows.

## Glue DataBrew

Provides masking techniques used to obfuscate PIIs during the data
preparation process.

## Glue Schema Registry

Registry for streaming data schemas. Formats: AVRO, JSON, Protobuf.
For integration with Kinesis Data Streams/Kafka/AWS MKS/Apache Flink.
