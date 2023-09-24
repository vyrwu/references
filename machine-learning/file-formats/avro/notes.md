# Apache AVRO

Row-oriented RPC data serialisation framework used in Apache Hadoop.
Used as serialisation format for persisted data, and wire format for
communication between Hadoop nodes.

Simillar to Thrift and Protobuf, but doesn't require code-generation.

## Schema
Uses AVRO IDL for human-readable schemas, and another JSON-based for
machine-readable schemas.
