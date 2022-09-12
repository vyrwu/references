# PrivateLink

Private IP endpoint within the VPC hosting some AWS services. Can be:
- some AWS services
- AWS services from other accounts
- supported AWS Marketplace services

PL services are reachable using private IPs' within a VPC (including private subnets).

Interface enpoints are created inside the VPC, using elastic network interfaces and IP addresses.

VPC Security Groups can be used to manage access to endpoints.

## Business Cases

### Expose an AWS service privately to an on-premise datacenter avoiding the Internet

Deploy AWS DirectConnect cable connection from on-premise datacenter to AWS. Expose target service using AWS PrivateLink.
