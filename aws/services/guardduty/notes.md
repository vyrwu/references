# GuardDuty

Intelligent threat detection service for logs from various sources in AWS. Detects unexpected or unauthorized traffic and platform usage patterns.

Issues like:
- privilidge escalation
- use of exposed credentials
- communication with malicious IP addresses
- malware in in EC2 and container workloads
- bitcoin mining software
- unauthorized infrastructure deployments
- unusual, potentially harmful API calls

Sources for GuardDuty:
- CloudTrail data events for S3 Logs
- CloudTrail management events logs
- DNS logs
- EBS volume data
- EKS audit logs
- VPC flow logs

## Findings
Produces findings of various types with severity information and remediation suggestion. Findings can be filtered through, and any change to the findings gets reported via Amazon EventBridge.

## Remediation
Remediation is done using other AWS services.
