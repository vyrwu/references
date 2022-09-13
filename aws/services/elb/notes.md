# ELB (Elastic Load Balancer)

Elastic Load Balancing automatically distributes traffic across multiple targets, such as EC2 intances, containers, and IP addresses, in one or more Availability Zone (AZ). It monitors health of its registered targets, and routes traffic only to healthy targets.

## Load Balancer
A single point of contact for the clients of the application to be load balanced.

## Listener Rules
ELB Listener matches requests against rules that define load balanging targets (Target Groups). Listener is configured with a protocol and port on which to listen for requests. Each listener has a default rule, and can have many other custom rules. ELB can have multiple Listeners.

When rule conditions are met, all health checks in a target group are run. HCs are always defined on a per-target group basis. Then, request gets forwarded to the TG.

## Target Groups
Collections of AWS resources serving as targets for load balancing (f.x. EC2 instances). Routing algorithm for load balancing is defined on the target group level.

ELB -> Listener (protocol:port) -> Rule (ELB features) -> Target Group -> (Health Check) -> Target 

## ELB Types

### ALB (Application Load Balancer)
Operates on a Layer-7 of the OSI Network Model (Application).

Listens for HTTP/HTTPS requests.

### NLB (Network Load Balancer)
Operates on a Layer-4 of the OSI Network Model (Transport).

Listens for TCP/UDP connections.

Can handle millions of requests per second. Creates network interfaces in every enabled AZ.

### GLB (Gateway Load Balancer)
Operates on a Layer-3 of the OSI Network Model (Network).

Listens for IP connections.

Suitable for virtual applications like firewalls, intrusion detection and prevention systems, and deep packet inspection systems. 

### CLB (Classic Load Balancer)
Same as ALB with few exceptions:
- Supports EC2-Classic
- Supports TCP and SSL listeners
- Supports sticky sessions using application generated cookies
  