# PostgreSQL Database Connection

## Description

Direct database connection to a PostgreSQL server for structured data access. Clients connect via JDBC/ODBC or native protocol, authenticate with username/password, and perform SQL queries. Common in enterprise data platforms, analytics pipelines, and application backends.

## Typical Access Pattern

- Connection string: `postgresql://user:pass@db.example.org:5432/research_db`
- Driver: JDBC (`org.postgresql.Driver`) or psycopg2
- SSL mode: `require` or `verify-full`
- Connection pooling via PgBouncer or application-level

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | HTTP/HTTPS (HttpProtocol) | PostgreSQL wire protocol (TCP) |
| Auth Scheme | Basic Authentication (BasicAuthentication) | Username + password |
| Operations | Read, Write, Delete, List | Full SQL DML |
| Delivery Mode | Synchronous Delivery (SynchronousDelivery) | Blocking query-response |
| Temporal Quality | Real-Time (RealTime) | Live transactional data |
| Coverage | Subset (SubsetCoverage) | Query-defined result set |
| Service Quality | High Availability (HighAvailability) | Managed DB with replication |
| Verification | No Verification (NoVerification) | Trusted internal connection |
| Encryption in transit | TLS 1.3 | SSL mode required |
| Encryption at rest | AES-256 | Transparent data encryption |
| Retention | 10 years | Clinical data compliance |
| Uptime | 99.95% | Managed DB SLA |
| RTO | 1 hour | Failover to replica |
| RPO | 5 minutes | Streaming replication lag |
| Replication | 2x | Primary + standby replica |
| ODRL Policy | Read permitted, Delete prohibited | Clinical data protection |

## Features Demonstrated

- ODRL prohibition (delete blocked for clinical data integrity)
- Encryption at rest + in transit
- Full service quality metrics (uptime, RTO, RPO, replication)
- Retention period for compliance

## References

- [PostgreSQL documentation](https://www.postgresql.org/docs/)
- [PostgreSQL wire protocol](https://www.postgresql.org/docs/current/protocol.html)
- [JDBC PostgreSQL driver](https://jdbc.postgresql.org/)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/generic-examples/postgresql/shape-data.ttl)
