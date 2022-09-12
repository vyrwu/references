# EBS (Elastic Block Storage)

Volume storage (block) that can be attached to the EC2 instance to persist data.

## Encryption
EBS support encryption at rest and in transit. All EBS types and EC2 instance families support encryption (not all instance types!). Data in transit between an EC2 instance and an encrypted EBS volume is encrypted. EC2 instance can have encrypted and unencrypted volumes attached at the same time. Snapshots of encrypted volumes are encrypted, and if used for EBS creation or recovery, they also produce encrypted snapshots.
