# EC2 (Elastic Compute)

EC2 nodes have families, within which has types. Use families when looking for a node type suitable for a workload. Type dictates the power of the node, and it's price.

## Pricing Models

### On-Demand
Good for ad-hoc compute requirements, unpredictable workloads, short lived projects or experimentation. Good for scheduled batch jobs which last a known duration of time and do not require the node after that. General purpose nodes. Have set price.

### Reserved Instances
Require a commitement of 1 to 3 years, at a discounted price. Good for predictable, production workloads, business critical workloads, continous usage etc. Can be sold on the AWS Marketplace if no longer needed, but this might not be cost-efficient.

### Spot
Unused on-demand capacity offered to AWS customers at a steep discount. Suitable for workloads that can withstand the loss of a node - development environments, stateless applications, interruptible processing. Typically run as a mix with On-Demand, where Spot is used only when the strike price is lower than the On-Demand.

## Storage

EC2 instances can mount EBS volumes and EC2 instance stores. EC2s can have multiple EBS volumes attached (encrypted or unencrypted).

## Business Case

### Processing of files requiring massive IOPS like video rendering or data processing

Perform processing on the EC2 instances with instance stores and save results to a persistent data store (DynamoDB/Aurora/RDS/ElastiCache etc.).
