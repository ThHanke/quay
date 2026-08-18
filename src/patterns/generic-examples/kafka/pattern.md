# Apache Kafka Topic

## Description

Apache Kafka topic providing event-driven data streaming. Producers publish events to topics, consumers subscribe and read in real-time or from a stored offset. Used for log aggregation, event sourcing, stream processing, and real-time analytics pipelines.

## Typical Access Pattern

- Bootstrap servers: `kafka.example.org:9092`
- Topic: `sensor-readings`
- Consumer group: `analytics-pipeline`
- Serialisation: Avro, JSON, or Protobuf with Schema Registry
- Offset management: automatic or manual commit

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | HTTP/HTTPS (HttpProtocol) | Kafka wire protocol (TCP-based) |
| Auth Scheme | API Key (ApiKeyAuthentication) | SASL/PLAIN or SASL/SCRAM |
| Operations | Read, Write | Consume and produce messages |
| Delivery Mode | Event-Driven Delivery (EventDrivenDelivery) | Continuous event stream |
| Temporal Quality | Real-Time (RealTime) | Live event ingestion |
| Coverage | Incremental (IncrementalCoverage) | Offset-based consumption |
| Service Quality | High Availability (HighAvailability) | Replicated partitions, ISR |
| Verification | No Verification (NoVerification) | Application-level if needed |
| Encryption at rest | Optional | Disk encryption on brokers |
| Encryption in transit | TLS | SASL_SSL listener |
| Rate Limit | 10000 msg/s | Producer throttling |
| Retention | 7 days | Topic retention policy |
| Uptime | 99.99% | Multi-broker cluster |
| Replication | 3x | Partition replication factor |
| ODRL Policy | Read rate-limited, Write permitted | Producer/consumer access rules |

## Features Demonstrated

- ODRL rate-limit constraint (`odrl:count` + `odrl:lteq`)
- Rate limit on AccessDescription
- Topic retention period
- Service quality metrics (uptime, replication)

## References

- [Apache Kafka documentation](https://kafka.apache.org/documentation/)
- [Kafka protocol specification](https://kafka.apache.org/protocol)
- [Confluent Schema Registry](https://docs.confluent.io/platform/current/schema-registry/)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/generic-examples/kafka/shape-data.ttl)
