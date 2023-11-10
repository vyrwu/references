# DynamoDB

AWS-managed NoSQL database deployment, with fast and predictable performance
with seamless scalability.

All data is stored on SSDs and automatically replicated across Availability
Zone.

Each table has three geographically distributed replicas. Features Multi-AZ and
Cross-region replication

Four 9s' availability, 5 9s' for Global tables.

## Global tables

Keep data in sync across AWS Regions.

Uses AWS AutoScaling service to automatically scale the table according to the
load, f.x., to handle peaks without throttling.

## DynamoDB Autoscaling

## DynamoDB Streams

Captures time-ordered sequence of item-level modifications in any DynamoDB
table. Stores the log for up to 24 hours in SNS (can be moved to S3 for
persistence).

## Dynamo Accelerator (DAX)

Fully-managed in-memory cache for DynamoDB. Greatly improves READ performance.
Good for bursty, read-heavy workloads.

Caches frequently read keyes to improve performance, solving "Hot Key" problems.

Cached data TTL is 5 mins. Can have up to 10 nodes (best Multi-AZ for Hight
Availability).

### When DAX, when ElastiCache?

- DAX for simple caching (QUERY & SCAN individual objects).
- ElastiCache for aggregations and custom caching logic.
- Can use both!

## DynamoDB Tile-To-Live (TTL)

Automatically deletes an item after TTL period.

## Business Cases

### Store large objects (more than 400KB) in DynamoDB

Store objects in S3, and put pointers to S3 in DynamoDB.

### Support lazy-loading caching strategy

Use ElastiCache for this, as DAX does not support it. Dax is specifically
designed for DynamoDB.
