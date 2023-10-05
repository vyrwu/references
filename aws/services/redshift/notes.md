# Redshift

Column-based, peta-byte scale data warehouse on AWS. Optimized for
running expensive SQL queries over large data sets. OLAP (Online
Analytical Processing). Useful for Business Intelligence teams and
use-cases.

Provisioning, scaling and managing clusters in this service is on the
customer, not AWS.

Data must be loaded to Redshift before running the SQL queries.

# Redshift Spectrum

Query data directly from files in S3 to avoid having to provision
Redshift Spectrum clusters.

# Redshift Serverless

Fully AWS-managed Redshift service, which infrastructure is managed by
AWS. Cluster scaling is automatic and adjusted to the load. Customers
only pay for the usage of the data.

## Redshift User Defined Functions

Redshift allows you to run massive SQL queries. UDFs are scalar
functions that can transform input data for further processing,
modeling and analysys. Simple UDFs are typically written using
SQL/Python, but more complex can be written as in AWS Lambda (f.x. to
lookup/join third-party data, or access network/storage resources).
