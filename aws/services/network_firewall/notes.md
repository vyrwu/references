# Network Firewall

AWS-managed stateful network firewall and intrusion detection and prevention service for VPCs. Allows filtering of network traffic on the perimeter of a VPC. Traffic can come from an Internet Gateway, NAT Gateway, over VPN or AWS Direct Connect

Uses open-source Suricata for stateful inspection.

## Use Cases
- Pass traffic only from known AWS domains or endpoints
- Use custom list of known bad domains to limit 
## Billing
- hourly per firewall endpoint
- amount of traffic per GB
- data transfer charges

## Business Cases

### Ensure instances in a private subnet can only access a specific thirt-party provider over the internet
Configure the subnet route table to direct outbound Internet traffic to the AWS Network Firewall, and configure domain list rule groups.
