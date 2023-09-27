# AWS Batch

Run batch jobs as docker images on dynamically provisioned instances,
with optimal type and quantity.

No clusters to manage - fully serverless. But, instances are
provisioned in the customers account.

Customers pay for the underlying EC2 instances.

## AWS Batch vs. Glue

AWS Batch is a generic service meant for any containerized job
workload. Glue is specific to ETL, and features deep integration with
Data Catalogue.

Use AWS Batch for any non-ETL related work. Use Glue for ETL.

