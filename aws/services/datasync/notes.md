# DataSync

Online data transfer service that simplifies, automates and
accelerates moving data from on-premise to AWS. Has encryption and
integrity verification built-in (in-transit and at-rest). Optimizes
network bandwidth and automatically recovers from network failures.
Provides visibility into the process through CloudWatch metrics, logs,
and events.

Can use DirectConnect for private connection to AWS.

DataSync Agent is deployed as a VM on-premise, and connects to the AWS
internal storage in your AWS accounts. 

## Targets

- Network File Shares (NFS)
- Server Message Block shares (SMB)
- HDFS (Hadoop)
- Self-managed object storage
- AWS snowcone
- S3 buckets
- EFS filesystems
- FSx for Windows File Server

## Business Cases

### Migrate active dataset to the cloud

### Archive data to free up on-premise storage space

### Replicate data to AWS for business continuity

### Transfer data to the cloud for analysis and processing
