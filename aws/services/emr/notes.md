# EMR (Elastic Map-Reduce)

AWS-flavoured Apache Spark deployment. Apache Spark is a general purpose
analytics engine for large-scale data processing.

Run large-scale data processing jobs, interactive queries and ML applications
using open-source frameworks (Spark/Hive/Presto/Hadoop).

Spark jobs can be triggered via Airflow/Step Functions/AWS CLI/pipelines.

Single AZ, re-run jobs in a healthy AZ if AZ fails.

Workers with defaults available. Workers can be pre-warmed.

## Instance customisation

- bootstrap action (scripts installing additional software on EMR nodes)
- customised cluster instances

## EMR Studio

Interactive UI integrated deeply with EMR for running Notebooks.

## Deployment targets

- EKS
- Serverless
- EC2
- AWS Outposts

## Use Cases

Make sense of the data in S3 datalake using open-source frameworks.

- ETL with Apache Spark
- SQL queries with Apache Hive
- Interactive analysis via Jupyter Notebooks
- Ad-hoc, cross-data source analysis with Apache Presto
- Real-time stream processing using Spark/Flink
- ML model training, data pre-processing, data validation
- Data analysis with Spark MLlib, TensorFlow or Apache MXNet
- Integrates with SageMaker.

## Storage

- HDFS (Hadoop Distributed File System) (can be complemented with S3)
  - EBS
  - Intance Storage
- EMRFS
  - S3
  - DynamoDB

## Cost Optimisation

Autoscaling is present, but can be deployed on Spot instances.
Capacity-optimised strategy can lower cost while maximising uptime. Transient
cluster option can also be used to lower cost (kills cluster if not used - good
for ad-hoc analysis only).

## Metadata Store

By default, the store is a MySQL DB deployed on a primary node of a cluster,
backed by an ephemeral instance store. For persistence of metadata store:

- AWS Glue Data Catalogue -> AWS-native data offerings.
- AWS RDS/Aurora -> allows integration with open-source tools.

## Permissions

- AWS Lake Formation
- Apache Ranger
