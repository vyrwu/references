# S3 (Simple Storage Service)

Object storage on AWS. S3 is a regional service. Services integrate with S3 using a REST API.

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
AWS-managed and customer-managed key encryption at rest is supported for S2. All objects uploaded to S3 that are to be encrypted must have an *"x-amz-server-side-encryption"* header set in the request headers.

## S3 Object Lambda
Lambda can be attached and run on a GET request for an object. Object is available to a Lambda. Client gets what Lambda returns.

## S3 Bucket Policies
Specify which actions are allowed for which principals on the bucket.
## Business Cases

### **Ensure that the bucket won't store unencrypted data.**

Create a bucket policy that denies Put requests without the *"x-amz-server-side-encryption"* header.

### **Ensure that objects uploaded to S3 are also encrypted prior to being uploaded to S3.**

Encrypt files before they are uploaded to S3 using your own key.

### Ned a reliable data storage for Machine Learning purposes (AI, data analysis, etc.)

Build a data lake on top of S3 (optionally use AWS Lake Formation).
