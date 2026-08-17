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
| Protocol | HTTP/HTTPS (QUAY_0000004) | PostgreSQL wire protocol (TCP) |
| Auth Scheme | Basic Authentication (QUAY_0000019) | Username + password |
| Operations | Read, Write, Delete, List | Full SQL DML |
| Delivery Mode | Synchronous Delivery (QUAY_0000060) | Blocking query-response |
| Temporal Quality | Real-Time (QUAY_0000035) | Live transactional data |
| Coverage | Subset (QUAY_0000041) | Query-defined result set |
| Service Quality | High Availability (QUAY_0000062) | Managed DB with replication |
| Verification | No Verification (QUAY_0000070) | Trusted internal connection |
| Encryption in transit | TLS 1.2+ | SSL mode required |

## References

- [PostgreSQL documentation](https://www.postgresql.org/docs/)
- [PostgreSQL wire protocol](https://www.postgresql.org/docs/current/protocol.html)
- [JDBC PostgreSQL driver](https://jdbc.postgresql.org/)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/generic-examples/postgresql/shape-data.ttl)
