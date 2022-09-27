# Inspector

Vulnerability management service for EC2 instances and container images residing in ECR. Scans for software vulnerabilities and unintended network exposures.

Produces findings with severity classification, and has an EventBridge integration.

## Findings

### Package vulnerability
Common vulnerabilities and exposure (CVEs). Uses publicly known list of vulnerabilities and exploits. Generated for both EC2 instances and ECR images.

### Network reachability
Scans EC2 instances for unintended network paths exposed at the edge of VPC (Internet Gateway/Direct Connect/VPGs/peering connections), to highlight potentially malicious access.
