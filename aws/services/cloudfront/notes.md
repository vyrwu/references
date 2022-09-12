# CloudFront

AWS-hosted CDN service, delivering static and dynamic content to clients using a worldwide network of data centers called edge locations. Edge locations are separate from Availability Zones. CDN features caching content at edge locations for better performance and lower latency.

## Origin


## Origin Group

## Business Cases

### Host a private static website on AWS efficiently and cost-effectively

Upload a website to an S3 bucket type "website". Create CF distribution. Create CF origin pointing to the S3 bucket. Create Route53 Alias record from desired domain name to the CF distribution URL. To block external bucket acccess, create CF Origin Identity, and create an S3 bucket policy which only allows the CF OI principal to access data the from the bucket.