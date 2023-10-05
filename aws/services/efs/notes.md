# EFS (Elastic File System)

File storage on AWS. Supports NFS and SMB file storage. Features
strong consistency, therefore good as a shared storage for multiple
EC2 instances across availability zones or Lambdas.

## Cost

Billed for:

- storage class
- the amount of data
- data access in IA

## POSIX Access Control

Access to files stored in EFS can be controlled using standard POSIX
users and groups.

## Lifecycle Management

Features lifecycle policies that can be applied to manage the
lifecycle of files stored. For example:

- Moving files to different storage classes
- Deleting files after certain period of time
- etc...

## Storage Classes

### EFS Standard

Used for frequently accessed data. Data replicated across AZs, so will
withstand a loss of an AZ.

### EFS Standard-IA (Infrequent Access)

Used for infrequently accessed data at a reduced cost. Data replicated
across AZs, so will withstand a loss of an AZ. Good to satisfy audit
requirements, performing historical analysis, or backup&restore.

### EFS One Zone&One Zone-IA

Same as Standard, but stored redundantly in only one AZ. Automatically
backs up the data with AWS Backup (backups are replicated to 3 AZs and
stored with 11 9's durability).

## Performance Modes

### General Purpose

Up to 35000 IOPS, lowest per-operation latency. Fit for vast majority
of use cases.

### Max I/O

500,000+ IOPS, higher per-operation latency than General Purpose.

## Throughput Modes

Throughput modes can be changed once every 24-hours.

### Bursting

Default EFS throughput mode, suitable for applications with bursty
throughput pattern. Throughput is calculated based on the amount of
data stored in the EFS - proportional to the size of the EFS, up to
per-region max quota. When inactive, or throughput is below metered
baseline, the EFS accumulates burst credits. When above the baseline,
it spends burst credits.

### Provisioned

Good for apps with consistent, known throughput. Throughput is
user-specified, billing is per excess throughput provisioned compared
to baseline.

## Business Cases

### **Move infrequently accessed data to another storage class after 7 days**

Save frequently used files in EFS Standard. Create EFS lifecycle
policy to move files to EFS Standard-IA after 7 days.
