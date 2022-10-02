# VPC (Virtual Private Cloud)
Virtual private network hosted on top of a scalable infrastructure of AWS. VPCs are logically isolated from each other. VPC can host resources and managed services privately, as if you owned the underlying infrastructure. You can assign IPv4 and IPv6 addresses to resources in your VPC, or bring your own GUA addresses to AWS, and assign them to resources you use.

## Availability Zone
A physical Data Center location, owned by Amazon. 

## Gateway
Gateway connects VPC to another network.

### Internet Gateway
Connects VPC to the Internet. Egress-only Internet Gateway provides egress-only access to the Internet using IPv6 adresses.

### Virtual Private Gateway
Fully redundant distributed edge routing function that sits at the edge of the VPC. VPG is the VPN concentrator on the Amazon side.

### Transit Gateway
Connects VPCs and on-premise networks via a central hub, simplifying network topology, and delivering transitive VPC peering. Connects VPCs in the same region. For cross region, connect TGs' from different regions to each other. Cannot attach a VPC from another region.

### NAT Gateway
Egress-only NAT service which allows instances from private subnets to access services outside the VPC (f.x. from the Internet). External services cannot initiate connections with the instances.

- Public (default): Routes to the VPCs' Internet Gateway. Alternatively, to other VPCs or on-prem networks (through a transit gateway). Uses public IP.
- Private: Routes to other VPCs or on-prem networks (through a transit gateway) only. Drops Internet-bound traffic. Uses private IP.

*NAT Instance is a customer-managed EC2 instance created from a NAT Instance AMI. Generally not recommended, as NAT Gateway is already redundant, resilient, scalable and fully managed by AWS.*

### Customer Gateway
Customer side of a VPN connection.
## Subnets
Range of IPs of a VPC, residing in a single AZ.

AWS reserves 5 IP addresses in each subnet:
- 10.0.0.0 - network address
- 10.0.0.1 - VPC router
- 10.0.0.2 - DNS server
- 10.0.0.3 - future use
- 10.0.0.255 - network broadcast address. Not used inside VPC, but still reserved.

### Routing Tables
Determines where the network traffic from a subnet or a gateway is directed. 200 RTs'/VPC; 50 entries/RT

On creation, VPC automatically gets a main route table (cannot be deleted).

Subnets implicitely use a main VPC route table by default (if custom not specified explicitely).

Use Transit Gateway routing tables to isolate your hybrid network topology even further.

### Subnet types

#### Public
Points to an Internet Gateway in the associated route table. Has "Auto-assign public IPv4 address" set to "Yes".

#### Private
Points to a Virtual Private Gateway in the associated route table.

## VPC Flow Logs
Captures info about the IP traffic going to and from network interfaces in the VPC.

## VPC Endpoint
Enables private access to supported AWS services and services powered by AWS PrivateLink withour requiring Internet access, NAT device, VPN connection or AWS DirectConnect. 

## VPC Security Groups
Control what traffic is allowed in or out of the VPC. Based on source (can be other SG), protocol and port.
- Default VPC SG: (in from SG only, out allowed)
- Custom VPC SG: (in denied, out allowed)

Ingress from all Internet network addresses -> Inbound rule, allow from source 0.0.0.0/0

### Interface endpoint
Some AWS Services, and external services powered by AWS PrivateLink.

### Gateway endpoint
DynamoDB and S3.

## Billing
- Interface endpoints: Billed hourly and for data processing.

## Network ACLs
Control IP-level access to the VPC on a subnet level. Does not control access within the subnet, but ingress/egress access to/from subnet. NACLs have permit and deny rules. Evaluated from lowest rule until explicit deny.
- Default (in allowed, out allowed)
- Custom (in denied, out denied)

## Business Case

### Simplify network topology by removing complex VPC peering associations and on-premise VPN connections.
Deploy a "hub-and-spoke" design for connecting VPCs and on-premise networks using a Transit Gateway.

### Provide access to an external service over the Internet using IPv6 address.
Deploy an Egress-only Internet Gateway.

### Isolate network topology configuration away from the business application
Deploy a Transit VPC using Transit Gateway.
