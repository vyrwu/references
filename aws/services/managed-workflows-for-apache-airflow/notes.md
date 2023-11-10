# Managed Workflows for Apache Airflow (MWAA)

Batch-oriented workflow tool. Workflows are defined in Python, via Directed
Acyclical Graphs (DAGs).

DAGs written in Python are uploaded to S3 and loaded into MWAA.

Autoscaling up to limits.

## Architecture

Workers and schedulers are implemented on top of ECS/Fargate, or EKS.

## Use cases

- ML data preparation
- ETL coordination
- Complex workflows
