# RDS (Relational Database Service)

AWS-managed instances of popular, row-based relational databases (MySQL,
PostgreSQL, MariaDB, Oracle/SQL Server).

## Multi-AZ

RDS instances can be replicated across multiple availability zones for high
availability.

## RDS Proxy

On high traffic, lots of database connections are opened and closed (especially
for serverless workloads). That exhausts RDS memory and compute quickly. RDS
Proxy is a fully-managed proxy which makes the application more scalable by
allowing clients to pool and share connections established with the database.
Good when scaling appling high-traffic serverless workloads.

## Read Replicas

RDS Read Replicas can be used to improve the performance of the main database,
especially when using the database for analytics.

## RDS for Microsoft SQL Server

RDS can host SQL Server databases. Customers can migrate between SQL databases
without any schema migration (automated with AWS Data Migration Service DMS).

## IAM auth for RDS

Replaces username&password auth with RDS-generated tokens (15 min TTL).

Limitations:

- Only supported on MariaDB/MySQL/PostgreSQL (NOT Microsoft SQL Server)
- Best for apps creating fewer than 200 conns/sec.

## Business Case

### Improve read performance of the RDS in a highly available way

Create Read Replicas of the main RDS DB as Multi-AZ DB instances.

### Improve RDS database efficiency and application scalability without any code changes.

Use RDS Proxy.

### Improve RDS database read performance.

Use AWS ElastiCache to cache the database layer.

### Migrate on-premise Microsoft SQL Server to AWS

Use AWS DMS (Database Migration Service). There is no need to convert schemas
for SQL databases.
