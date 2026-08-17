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
| Protocol | HTTP/HTTPS (QUAY_0000004) | Kafka wire protocol (TCP-based) |
| Auth Scheme | API Key (QUAY_0000017) | SASL/PLAIN or SASL/SCRAM |
| Operations | Read, Write | Consume and produce messages |
| Delivery Mode | Event-Driven Delivery (QUAY_0000033) | Continuous event stream |
| Temporal Quality | Real-Time (QUAY_0000035) | Live event ingestion |
| Coverage | Incremental (QUAY_0000043) | Offset-based consumption |
| Service Quality | High Availability (QUAY_0000062) | Replicated partitions, ISR |
| Verification | No Verification (QUAY_0000070) | Application-level if needed |
| Encryption at rest | Optional | Disk encryption on brokers |
| Encryption in transit | TLS | SASL_SSL listener |

## References

- [Apache Kafka documentation](https://kafka.apache.org/documentation/)
- [Kafka protocol specification](https://kafka.apache.org/protocol)
- [Confluent Schema Registry](https://docs.confluent.io/platform/current/schema-registry/)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/generic-examples/kafka/shape-data.ttl)
