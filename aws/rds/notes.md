# RDS (Relational Database Service)
AWS-managed instances of popular relational databases (MySQL, PostgreSQL, MariaDB, Oracle/SQL Server).

## Multi-AZ
RDS instances can be replicated across multiple availability zones for high availability.

## Read Replicas
RDS Read Replicas can be used to improve the performance of the main database, especially when using the database for analytics.

## Business Case

### Improve read performance of the RDS in a highly available way
Create Read Replicas of the main RDS DB as Multi-AZ DB instances.
