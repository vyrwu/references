# S3 (Simple Storage Service)

Object storage on AWS. S3 is a regional service. Services integrate with S3 using a REST API.

Names of S3 buckets must be unique globally, and the files (objects) inside the
buckets have names (keys). There are no directories in S3. F.x:

- ano_bucket/test_data/dataset.txt <- this is an S3 bucket object

Max object size in S3 is 5TB.

Supports ANY file format (CSV/JSON/Parquet/ORC/AVRO/Protobuf).

## S3 Object tags

Up to 10 tags per object, use to classify data/security/lifecycle.

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

Apply features lifecycle policies to manage the lifecycle of files stored. For example:

Lifecycle rules can be applied based on key prefix, or object tags.

- Transition action: moves objects to another storage class. Examples:
  - Move objects to Glacier after 60 days.
  - Move objects to Standard-IA after 30 days.
- Expiration actions: deletes files after certain period of time
  - Access logs can be deleted after 365 days.
  - Delete old versions of files.
  - Delete incomplete multi-part uploads.

Using Lifecycle rules we can automatically move objects between storage classes
based on rules.

## Networking

VPC Endpoint is used to expose S3 bucket endpoint privately. Then, request
header can be evaluated to find `SourceVpc` or `SourceVpce`. Can be enforced
with S3 Bucket Policy.

## Encryption

All objects uploaded to S3 that are to be encrypted must have an
_"x-amz-server-side-encryption"_ header set in the request headers.

Bucket Policies are used to enforce encryption (take priority over the
default bucket encryption settings).

### SSE-S3

Server-side with S3-managed keys.

- Enabled by default
- Header `"x-amz-server-side-encryption": "AES256"`
- Amazon-managed keys, AES-256 encryption

### SSE-KMS

Server-side with KMS-managed keys.

WARNING: Uploads and decrypts count towards KMS API limits (5500/10000/30000 based on region, can be increased).

- Customer manages keys with KMS
  - User control and audit via CloudTrail
- Header `"x-amz-server-side-encryption": "aws:kms"`

### SSE-C

Server-side with customer-managed keys.

- Customer uploads key via HTTP Header.
- Must use HTTPS.
- S3 does NOT store keys.

### Client-Side Encryption

Encrypt before storing in S3, for extra security.
Use Amazon S3 Client-Side Encryption Library.
Customer fully managed the entire encryption lifecycle (encryption/decryption).

### Encryption in Transit

S3 exposes HTTP and HTTPS endpoints. Use HTTPS for TLS.
Encryption in transit can be enforced on the bucket via S3 Bucket Policy:

```JSON
{
  "Id": "ExamplePolicy",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowSSLRequestsOnly",
      "Action": "s3:*",
      "Effect": "Deny",
      "Resource": [
        "arn:aws:s3:::DOC-EXAMPLE-BUCKET",
        "arn:aws:s3:::DOC-EXAMPLE-BUCKET/*"
      ],
      "Condition": {
        "Bool": {
          "aws:SecureTransport": "false"
        }
      },
      "Principal": "*"
    }
  ]
}
```

## S3 Object Lambda

Lambda can be attached and run on a GET request for an object. Object is available to a Lambda. Client gets what Lambda returns.

## S3 Bucket Policies

Specify which actions are allowed for which principals on the bucket. This
is the default and preferred security enforcement on S3. ACLs should be avoided.

Can be used to:

- Make objects public. (Does not override Block all public access.)
- Force objects to be encrypted at upload.
- Allow cross-account access (best practice is assume role, though).

## Event Notification

S3 buckets can be configured to send notifications to selected services when objects become available. Can send alerts or trigger actions. Supported targets:

- SNS Topic
- SQS Queue
- Lambda Function

## Storage Classes

Durability: 11 9' for all Storage classes.
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

Moves data between storage classes based on usage. Incurs a monitoring
and auto-tiering fee.
Tiers:

- Frequent Access
- Infrequent Access: 30d+
- Archive Instant Access: 90d+
- (Optional) Archive Access: config. 90-700d+
- (Optional) Deep Archive Access: config. 180-700d+

## S3 Storage Class analysis

Puts together a CSV report with storage class recommendations for each object.
Useful when improving S3 lifecycle policies. Report comes within 24-48h,
and is updated daily.

## Business Cases

### **Ensure that the bucket won't store unencrypted data.**

Create a bucket policy that denies Put requests without the _"x-amz-server-side-encryption"_ header.

### **Ensure that objects uploaded to S3 are also encrypted prior to being uploaded to S3.**

Encrypt files before they are uploaded to S3 using your own key.

### Need a reliable data storage for Machine Learning purposes (AI, data analysis, etc.)

Build a data lake on top of S3 (optionally use AWS Lake Formation).

### Rarely recover deleted files up to 30 days instantly, then up to 365 days within 48h.

Enable S3 versioning to keep objects with the "deleted" marker instead of removing them.
Then, move the non-current file versions to Standard-IA, and after 30 days, move them to
Glacier.
