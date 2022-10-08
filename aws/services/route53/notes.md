# Route53

Hosed DNS service.

## Hosted Zone


## Record Types

### A
Redirect to an IPv4.
*f.x. example.com -> 194.35.21.1*

### AAAA
Redirect to an IPv6.
*f.x. example.com -> 2001:0db8:85a3:0:0:8a2e:0370:7334*

### Alias
Redirect to selected AWS Resources:
- API Gateway
- VPC Interface Endpoint
- CloudFront distribution
- S3 bucket
- Elastic Beanstalk environment
- ELB Load Balancer
- Another record in this hosted zone (except. NS and SOA)

### CNAME
Redirects to another domain or sub-domain. Name cannot be zone apex (f.x. example.com).
*f.x. www.example.com -> prod.example.com
f.x. test.example.com -> euw1.test.example.com*

### CAA
Specifies which CA can issue SSL/TLS certs for this domain, as well as which URL and e-mail to contact when CA issues a cert.

### DS
Refers to a zone key for a delegated subdomain zone.

### MX
Redirects to prioritised list of mail server domain names.

### NS
Delegate responsibility over a subdomain to a hosted zone.
*f.x. prod.example.com -> example.com >> prod.example.com (subdomain of example.com now is it's own hosted zone prod.example.com)*

### PTR
Redirect IP address to a domain.
*f.x. 194.35.21.1 -> example.com*

### SOA
Provides info about the domain and AWS Route53 hosted zone.

### TXT
Returns text.
*f.x. txt.example.com -> "This is example text."*
