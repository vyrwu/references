# Data Engineering Associate Beta

[Modern Data Architecture](https://aws.amazon.com/big-data/datalakes-and-analytics/modern-data-architecture/)
acknowledges that data must be movable. AWS products offer a variety of features
and capabilities to move the data in/out of datalakes and data warehouses, and
purpose-built data sources.

Pillars of modern data architecture:

- Scalable Data Lakes: S3/Athena/Glue/Lake Formation
- Purpose-built analytics services: Athena/EMR/OpenSearch/Kinesis/Redshift
- Unified data access: Glue/Kinesis Data Firehose
- Unified Governance: Lake Formation
- Cost Effective: S3/EC2/EMR

## Content

### Data Ingestion and Transformation (34%)

#### Perform data ingestion.

Act of generating/collecting/moving data from various cloud-based/on-prem
sources into AWS Cloud.

Ingestion patterns:

1. Homogeneous (ELT) - same "kind" of data source and format, or file ingestion
   into S3. (Ex. from SQL to SQL/blob to blob storage/etc.)
2. Heterogeneous (ETL) - different data format, transformations or even
   enriching via ML. Added transformation is key. (Ex. NoSQL to
   SQL/Transformations/Parquet to ORC)

Data types in data-lake architecture:

1. Real-time streaming and bulk data assets, from on-prem
2. Structured data generated/stored on-prem in mainframes and warehouses.
3. Unstructured/Semi-structured data - images/text/audio/video/graphs.

##### Kinesis Data Firehose

#### Throughput and latency characteristics for AWS services that ingest data

-

### Data Store Management (26%)

### Data Operations and Support (22%)

### Data Security and Governance (18%)
