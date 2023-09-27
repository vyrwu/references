# Data Pipeline

Orchestration service that can be used to do ETL, to move data between
different data sources in AWS.

Data Pipelines is not fully managed - it provisions EC2/EMR instances
in the customer's account, to do the orchestration.

This service is in maintenance mode and will no longer be expanded.

## Data Pipelines vs. Glue

Glue is a fully managed AWS service, build on top of Apache Spark.
Data Pipelines it not managed, as it's provisions the instances in the
customers account.

## Destinations
- S3
- RDS
- DynamoDB
- Redshift
- EMR
