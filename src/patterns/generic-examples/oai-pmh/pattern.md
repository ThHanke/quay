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
| Protocol | HTTP/HTTPS (QUAY_0000004) | OAI-PMH over HTTP |
| Auth Scheme | No Authentication (QUAY_0000016) | Public harvesting endpoint |
| Operations | Read, List | Harvest and enumerate sets |
| Delivery Mode | Paginated Delivery (QUAY_0000032) | Resumption token pagination |
| Temporal Quality | Archived (QUAY_0000037) | Repository metadata records |
| Coverage | Incremental (QUAY_0000043) | Date-based selective harvesting |
| Service Quality | Best Effort (QUAY_0000063) | Institutional infrastructure |
| Verification | No Verification (QUAY_0000070) | No integrity mechanism |
| Encryption in transit | TLS | HTTPS when available |

## References

- [OAI-PMH specification v2.0](http://www.openarchives.org/OAI/openarchivesprotocol.html)
- [OAI-PMH guidelines for repository implementers](https://www.openarchives.org/OAI/2.0/guidelines.htm)
