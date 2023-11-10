# SageMaker

Fully managed ML service from AWS. Targets the entire lifecycle on an ML model
(developing, training, deploying).

## SageMaker Data Wrangler

Feature of SageMaker Studio - import, prepare, transform, analyze data.
Integrates with ML workflow to streamline feature engineering and data
pre-processing.

Import, visualize and transform data (300+ options). Integrate own integrations
(pandas/PySpark/PySpark SQL).

IMPORTANT: Does NOT do the data processing -> only generates code as Jupiter
Notebook to do the transformation. More like a code generation tool. Generates
ETL code that will sit in the pipelines.

Important - does not offer any guarantees.

### Sources

- anything JDBC (Databricks/SAAS)
- AWS Athena
- AWS Redshift
- AWS SageMaker Feature Store
- AWS Lake Formation
- Amazon S3

### Destinations

- SageMaker Feature Store
- SageMaker Pipelines
- SageMaker Processing

# SageMaker ML Lineage Tracking

Creates audit log of all steps on an ML workflow, from data prep to model
deployment. Used to establish governance and audit standards over ML model.

Keeps running history of model experiments. Tracks model lineage artifacts for
compliance.
