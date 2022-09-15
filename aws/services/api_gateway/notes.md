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


### Business Cases