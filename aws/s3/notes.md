# S3 (Simple Storage Service)

Object storage on AWS. S3 is a regional service. Services integrate with S3 using a REST API.

## Encryption
AWS-managed and customer-managed key encryption at rest is supported for S2. All objects uploaded to S3 that are to be encrypted must have an *"x-amz-server-side-encryption"* header set in the request headers.

## Business Cases

### **Ensure that the bucket won't store unencrypted data.**

Create a bucket policy that denies Put requests without the *"x-amz-server-side-encryption"* header.

### **Ensure that objects uploaded to S3 are also encrypted prior to being uploaded to S3.**

Encrypt files before they are uploaded to S3 using your own key.
