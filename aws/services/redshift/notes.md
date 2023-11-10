# Redshift

Column-based, peta-byte scale data warehouse on AWS. Optimized for running
expensive SQL queries over large data sets. OLAP (Online Analytical Processing).
Useful for Business Intelligence teams and use-cases.

Provisioning, scaling and managing clusters in this service is on the customer,
not AWS.

Data must be loaded to Redshift before running the SQL queries.

# Redshift Spectrum

Query data directly from files in S3 to avoid having to provision Redshift
Spectrum clusters.

# Redshift Serverless

Fully AWS-managed Redshift service, which infrastructure is managed by AWS.
Cluster scaling is automatic and adjusted to the load. Customers only pay for
the usage of the data.

## Redshift User Defined Functions

Redshift allows you to run massive SQL queries. UDFs are scalar functions that
can transform input data for further processing, modeling and analysys. Simple
UDFs are typically written using SQL/Python, but more complex can be written as
in AWS Lambda (f.x. to lookup/join third-party data, or access network/storage
resources).

## Materialized Views

Query performance can be vastly improved by using materialized views. They allow
expensive queries to be loaded into memory, and reused in other queries. To
refresh the data in the materialized view:

- run `REFRESH MATERIALIZED VIEW` command to manually refresh the data
- use Redshift Scheduler API to refresh data on-demand
- setup autorefresh, which will run when cluster has the most available
  resources based in its usage pattern

## Redshift Data Sharing

Share read access to live data between Redshift clusters and Redshift Serverless
at no additional cost, without copying the data.

## Redshift UNLOAD

Can unload the results of a query as text/JSON/Parquet files to S3 (with SSE).
Useful when unloading data from Redshift to S3 for long-term storage.

WARNING: does not support unloading to S3 Glacier tiers.
