# DX (Direct Connect)

Dedicated connection over a private line straight into the AWS backbone network. Designed for connecting large on-premise data centers with AWS. Provides low-latency, high-bandwith and security. Up to 10 Gbps, supports BGP peering and routing. DX traffic is not encrypted by default.

## Virtual Interfaces

To begin using DX connection, you must create VIFs (Virtual Interfaces). 

- Public: accesses public AWS services using a public IPs'
- Private: accesses private AWS resources inside a VPC using private IPs'
- Transit: connects DX to a Transit Gateway

## Direct Connect Gateway

Gateway connecting a DX connection with either:
- Transit Gateway (for hubbed VPCs')
- Virtual Private Gateway (for single VPC)

## Business Cases

### Add resiliency and encryption to an existing Direct Connect connection.
Add AWS Site-To-Site VPN over Internet on the side of the DX. DX connection is primary. VPN is backup. VPN link is also used to encrypt all traffic going through the DX connection.
