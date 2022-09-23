# API Gateway

Managed service for publishing, monitoring, maintaining and securing REST, HTTP and Web Socket APIs at scale.

## API Gateway Types

### REST API
APIG supports creating REST APIs directly on the Gateway. APIG REST can set DynamoDB table as target.

### HTTP API
HTTP REST APIs have lower latency and lower cost than REST API type. With those, you need to create a Lambda as a target backend for the APIG, which processes and saves the payload to a persistent datastore.

Supports OpenID Connect and OAuth 2.0.

### WebSocket API
Targeted use-cases are real-time applications like live chatrooms, RT dashboards, RT data feeds like stock tickers, RT alerts and notifications. 

## Access Management to APIs

### Resource-based policies
Allow/Deny access to APIs and methods from specified IPs addresses or VPC endpoints.

### AWS IAM and Tags
Define IAM roles and policies, controlling who can create or manage APIs, as well as who can invoke them. Applies to entire APIs as well as individual methods. AWS Tags can further be used for more granular access.

### Interface VPC endpoints
Resource IAM policies can be attached to the VPC endpoint to enhance security of private APIs.

### Lambda authorizers
Used to control who can invoke REST API methods, based on request headers, paths, query strings, stage variables, and most importantly a bearer token. 

### Amazon Cognito
Cognito User Pools are used to create customizable authn/authz flows. 

### Business Cases