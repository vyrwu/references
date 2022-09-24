# Simple Token Service (STS)

Web service issuing temporary, limiting-privilige credentials for IAM users or federated users.

By default, STS is a global service, but there are region-specific endpoints (users can configure those).

## Logging
Can be configured with CloudTrail sending STS operations logs to S3.
