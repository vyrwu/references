# S3 (Simple Storage Service)

Object storage on AWS. S3 is a regional service. Services integrate with S3 using a REST API.

Names of S3 buckets must be unique globally, and the files (objects) inside the
buckets have names (keys). There are no directories in S3. F.x:

- ano_bucket/test_data/dataset.txt <- this is an S3 bucket object

Max object size in S3 is 5TB.

Supports ANY file format (CSV/JSON/Parquet/ORC/AVRO/Protobuf).

## S3 Object tags

Up to 10 tags per object, can be used to classify data/security/lifecycle.

## S3 Data lake

S3 is a backbone for Machine Learning on AWS.
S3 has infinite size and no provisioning. AWS decouples storage (S3) from
compute (EC2/Athena/Redshift Spectrum/Rekognition/AWS Glue).

## S3 Data Partitioning

Partitioning is done by object key. f.x.

Typical strategies:

- By Date: `s3://ano_bucket/data/year/month/day/hour/data_01.csv`
- By Product: s3://ano_bucket/data/product-id/data_01.csv

Partitioning the data speeds up range queries.

## Billing

You pay for:

- data stored
- requests made against S3
- transfer OUT of S3 (IN is free)
- management features (S3 Inventory, S3 Storage Class analysis, S3 Storage Lens, S3 Object Tagging)
- bucket replication
- data returned from S3 Object Lambda

## Lifecycle Management

Features lifecycle policies that can be applied to manage the lifecycle of files stored. For example:

- Transition action: moves objects to another storage class.
- Expiration actions: deletes files after certain period of time
- etc...

## Encryption

AWS-managed and customer-managed key encryption at rest is supported for S2. All objects uploaded to S3 that are to be encrypted must have an _"x-amz-server-side-encryption"_ header set in the request headers.

## S3 Object Lambda

Lambda can be attached and run on a GET request for an object. Object is available to a Lambda. Client gets what Lambda returns.

## S3 Bucket Policies

Specify which actions are allowed for which principals on the bucket.

## Event Notification

S3 buckets can be configured to send notifications to selected services when objects become available. Can send alerts or trigger actions. Supported targets:

- SNS Topic
- SQS Queue
- Lambda Function

## Storage Classes

Durablility: 11 9' for all Storage classes.
Availability: 2 9' (53min down-time per year)

### Standard

#### S3 Standard

For frequently accessed data. Low latency, high throughput.
Use-cases: Big Data analysis, mobile&gaming, content distribution.

- 99.99% availability
- multi-AZ (up to 2 concurrent AZ failures).

#### S3 Standard-IA (Infrequent Access)

Rapid access when needed. Lower storage cost than GP, but cost on retrieval.
Use-cases: Disaster Recovery&Backups

- 99.99% availability
- multi-AZ

#### S3 OneZone-IA (One-Zone Infrequent Access)

Rapid access when needed. Lower storage cost than GP, but cost on retrieval.
Use-cases: Secondary backup copies from on-prem data (data that can be recreated)

- 99.5% availability
- single-AZ (lost upon AZ failure)

### Glacier

For long-term storage and backups. Much cheaper than standard.
Use case: regulatory long-term storage of data, backups, etc. Or for
data access quarterly.

#### S3 Glacier Instant Retrieval

- Retrieval: milliseconds
- Min. storage duration: 90 days

#### S3 Glacier Flexible Retrieval

- Retrieval:
  - Expedited (1-5 min)
  - Standard (3-5 h)
  - Bulk (5-12 h) - free
- Min. storage duration: 90 days

#### S3 Glacier Deep Archive

- Retrieval:
  - Standard (12 hours)
  - Bulk (48 hours)
- Min. storage duration: 180 days

### Intelligent Tiering

Moves data between storage classes based on usage. Incurrs a monitoring
and auto-tiering fee.
Tiers:

- Frequent Access
- Infrequent Access: 30d+
- Archive Instant Access: 90d+
- (Optional) Archive Access: config. 90-700d+
- (Optional) Deep Archive Access: config. 180-700d+

## Business Cases

### **Ensure that the bucket won't store unencrypted data.**

Create a bucket policy that denies Put requests without the _"x-amz-server-side-encryption"_ header.

### **Ensure that objects uploaded to S3 are also encrypted prior to being uploaded to S3.**

Encrypt files before they are uploaded to S3 using your own key.

### Ned a reliable data storage for Machine Learning purposes (AI, data analysis, etc.)

Build a data lake on top of S3 (optionally use AWS Lake Formation).
