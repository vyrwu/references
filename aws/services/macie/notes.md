# Macie

Managed data privacy service that creates inventory of S3 buckets and scans them for sensitive data like PIIs (Personally Identifiable Information). Can also monitor buckets for security and access control. Can report overly permissive or unencrypted buckets.

Creates reports, which are remedied using other AWS services.

Stores findings for 90 days.

## Findings
Produces findings of various types with severity information and remediation suggestion. Findings can be filtered through, and any change to the findings gets reported via Amazon EventBridge. 

## Remediation
Remediation is done using other AWS services.