# SPARQL Endpoint

## Description

SPARQL Protocol endpoint serving RDF data from a triplestore. Clients submit SPARQL queries via HTTP and receive results as streaming XML, JSON, or CSV. Publicly accessible endpoints typically require no authentication. Common in linked data, knowledge graphs, and semantic web applications.

## Typical Access Pattern

- Endpoint: `https://dbpedia.org/sparql`
- Query via HTTP GET: `?query=SELECT...&format=json`
- Or HTTP POST with query in body
- Results: `application/sparql-results+json`, `text/turtle`, `text/csv`

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | HTTP/HTTPS (QUAY_0000004) | SPARQL Protocol over HTTP |
| Auth Scheme | No Authentication (QUAY_0000016) | Public endpoint |
| Operations | Read | SELECT, CONSTRUCT, DESCRIBE, ASK |
| Delivery Mode | Streaming Delivery (QUAY_0000031) | Result stream, may be chunked |
| Temporal Quality | Real-Time (QUAY_0000035) | Live triplestore query |
| Coverage | Subset (QUAY_0000041) | Query-defined result set |
| Service Quality | Best Effort (QUAY_0000063) | Public endpoint, no SLA |
| Verification | No Verification (QUAY_0000070) | No integrity mechanism |
| Encryption in transit | TLS | HTTPS when available |

## References

- [SPARQL 1.1 Protocol](https://www.w3.org/TR/sparql11-protocol/)
- [SPARQL 1.1 Query Language](https://www.w3.org/TR/sparql11-query/)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/generic-examples/sparql-endpoint/shape-data.ttl)
