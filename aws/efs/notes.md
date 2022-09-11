# EFS (Elastic File System)

File storage on AWS. Supports NFS and SMB file storage. Features strong consistency, therefore good as a shared storage for multiple EC2 instances across availability zones.

## Cost
Billed for:
- storage class
- the amount of data
- data access in IA
- 
## POSIX Access Control
Access to files stored in EFS can be controlled using standard POSIX users and groups.

## Lifecycle Management
EFS storage features lifecycle policies that can be applied to manage the lifecycle of files stored. For example:
- Moving files to different storage classes
- Deleting files after certain period of time
- etc... 

## Storage Classes

### EFS Standard
Used for frequently accessed data. Data replicated across AZs, so will withstand a loss of an AZ.

### EFS Standard-IA (Infrequent Access)
Used for infrequently accessed data at a reduced cost. Data replicated across AZs, so will withstand a loss of an AZ. Good to satisfy audit requirements, performing historical analysis, or backup&restore.

### EFS One Zone&One Zone-IA
Same as Standard, but stored redundantly in only one AZ. Automatically backs up the data with AWS Backup (backups are replicated to 3 AZs and stored with 11 9's durability).

## Business Cases

### **Move inferquently accessed data to another storage class after 7 days**

Save frequently used files in EFS Standard. Create EFS lifecycle policy to move files to EFS Standard-IA after 7 days.