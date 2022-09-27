# EventBridge

Serverless managed event bus service. Delivers a stream of real-time data from own applications, third party SaaS apps, and other AWS services, to targets such as AWS Lambda, HTTP invocation endpoints via API destinations, or event busses in other AWS accounts.

Receives and event, and applies a rule to route event to target. Matches based on the event structure, or schedule.

Delivers a lot of useful events generated from AWS services, like EC2 instance changes, threat detection and data privacy findings, and more. Those can be automatically reacted to by acting on the event. 

All events have schemas, which describe the structure of events. All events in EventBridge have schemas.

You can archive, save, and replay events at the later time from the archive. Archiving and replaying is useful for testing applications.
