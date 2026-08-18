# OAI-PMH Harvesting

## Description

Open Archives Initiative Protocol for Metadata Harvesting (OAI-PMH) endpoint for systematic metadata collection from digital repositories. Clients harvest records incrementally using date-based selective harvesting. Used by libraries, digital archives, and aggregators like Europeana and BASE.

## Typical Access Pattern

- Base URL: `https://repo.example.edu/oai`
- Verbs: `ListRecords`, `GetRecord`, `Identify`, `ListSets`
- Incremental: `?verb=ListRecords&metadataPrefix=oai_dc&from=2024-01-01`
- Resumption tokens for large result sets

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | HTTP/HTTPS (HttpProtocol) | OAI-PMH over HTTP |
| Auth Scheme | No Authentication (NoAuthentication) | Public harvesting endpoint |
| Operations | Read, List | Harvest and enumerate sets |
| Delivery Mode | Paginated Delivery (PaginatedDelivery) | Resumption token pagination |
| Temporal Quality | Archived (Archived) | Repository metadata records |
| Coverage | Incremental (IncrementalCoverage) | Date-based selective harvesting |
| Service Quality | Best Effort (BestEffort) | Institutional infrastructure |
| Verification | No Verification (NoVerification) | No integrity mechanism |
| Encryption in transit | TLS | HTTPS when available |
| Schema | OAI-PMH v2.0 | `dcterms:conformsTo` |
| ODRL Policy | Read + List permitted | Harvesting access rules |

## Features Demonstrated

- ODRL fine-grained permissions (Read + List as separate rules)
- Schema link via `dcterms:conformsTo`

## References

- [OAI-PMH specification v2.0](http://www.openarchives.org/OAI/openarchivesprotocol.html)
- [OAI-PMH guidelines for repository implementers](https://www.openarchives.org/OAI/2.0/guidelines.htm)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/generic-examples/oai-pmh/shape-data.ttl)
