# Cloud Trail

## Cloud Trail Lake

Managed datalake for CloudTrail events (converted to columnar ORC format).

Allows to query CloudTrail data with SQL.

WARNING: remember to bound queries by `eventTime`, as unbounded queries are
expensive.

Data retention: 7 years.

Collect management + data events. Management events are enough compliance wise
as data events might get costly.

Features advanced event selector (for filetring ingested events).

Warning: KMS events cost tends to blow up a lot if enabled, but can be disabled.

## Channels

Allows Cloud Trail Lake to integrate with 3rd party events

- Okta
- LaunchDarkly
- Clumio
- other CloudTrail partners...
- custom proprietary source
