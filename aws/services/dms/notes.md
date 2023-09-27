# AWS Database Migration Service

Database migration tool.

Source DB remains available during the migration.

Supports homo/hetero-genous DB migrations.

Continuous Data Replication using CDC (features on-going data
replication on a live cluster).

Requires an EC2 instance to perform the replication.

## DMS vs. Glue

Glue is batch oriented (min. 5min for ETL), DMS is real-time.

DMS does not feature data transformation (usually Glue is applied
after the migration for transformations).
