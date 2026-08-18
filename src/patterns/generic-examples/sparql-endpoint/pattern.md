# SPARQL Endpoint

## Description

RDF data from a triplestore endpoint. Clients submit SPARQL queries via HTTP and receive results as streaming XML, JSON, or CSV. Publicly accessible endpoints typically require no authentication. Common in linked data, knowledge graphs, and semantic web applications.

## Typical Access Pattern

- Endpoint: `https://dbpedia.org/sparql`
- Query via HTTP GET: `?query=SELECT...&format=json`
- Or HTTP POST with query in body
- Results: `application/sparql-results+json`, `text/turtle`, `text/csv`

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | HTTP/HTTPS (HttpProtocol) | SPARQL Protocol over HTTP |
| Auth Scheme | No Authentication (NoAuthentication) | Public endpoint |
| Operations | Read | SELECT, CONSTRUCT, DESCRIBE, ASK |
| Delivery Mode | Streaming Delivery (StreamingDelivery) | Result stream, may be chunked |
| Temporal Quality | Real-Time (RealTime) | Live triplestore query |
| Coverage | Subset (SubsetCoverage) | Query-defined result set |
| Service Quality | Best Effort (BestEffort) | Public endpoint, no SLA |
| Verification | No Verification (NoVerification) | No integrity mechanism |
| Encryption in transit | TLS | HTTPS when available |
| Schema | SPARQL 1.1 Protocol | `dcterms:conformsTo` |
| ODRL Policy | Read permitted | Public query access |

## Features Demonstrated

- ODRL simple read-only permission
- Schema link via `dcterms:conformsTo`
- Minimal ODRL policy (single permission, no constraints)

## References

- [SPARQL 1.1 Protocol](https://www.w3.org/TR/sparql11-protocol/)
- [SPARQL 1.1 Query Language](https://www.w3.org/TR/sparql11-query/)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/generic-examples/sparql-endpoint/shape-data.ttl)
