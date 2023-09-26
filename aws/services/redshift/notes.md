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
