# Storage Gateway

Hybrid cloud storage for on-premise environments, based on AWS S3. Provides local storage resources access to S3 and Glacier.

## Types

### File Gateway
Mount on-prem instances or EC2s to S3 using SMB or NFS.

### Volume Gateway Stored Mode
Asynchronously replicate data to S3. Interface - iSCSI (block).

### Volume Gateway Cached Mode
S3 storage with frequently accessed data cached locally. Interface iSCSI (block).

### Tape Gateway
Tape library to be used with existing backup software. Interface - iSCSI (block)
