# CKAN Open Data Portal

## Description

Leading open data portal platform. Provides a REST API for searching, browsing, and downloading datasets. Powers data.gov, data.gov.uk, and hundreds of other portals.

## Typical Access Pattern

- API: `https://data.gov/api/3/action/package_search?q=climate`
- Resource download: `https://data.gov/dataset/{id}/resource/{rid}/download/{file}`
- Datastore API: `https://data.gov/api/3/action/datastore_search?resource_id={id}`
- No authentication for public datasets

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | HTTP/HTTPS (HttpProtocol) | CKAN Action API |
| Auth Scheme | No Authentication (NoAuthentication) | Public open data |
| Operations | Read, List | Search, browse, download |
| Delivery Mode | Paginated Delivery (PaginatedDelivery) | Paginated search results |
| Temporal Quality | Snapshot (Snapshot) | Published dataset versions |
| Coverage | Subset (SubsetCoverage) | Search-filtered results |
| Service Quality | Best Effort (BestEffort) | Government infrastructure |
| Verification | No Verification (NoVerification) | No integrity mechanism |
| Encryption in transit | TLS | HTTPS |
| Schema | CKAN API spec | `dcterms:conformsTo` |
| ODRL Policy | Read permitted, Write prohibited | Public read-only portal |

## Features Demonstrated

- ODRL prohibition (write blocked — public portal)
- ODRL open-access read permission
- Schema link via `dcterms:conformsTo`

## References

- [CKAN documentation](https://docs.ckan.org/)
- [CKAN API guide](https://docs.ckan.org/en/latest/api/)
- [CKAN instances worldwide](https://ckan.org/showcase)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/generic-examples/ckan/shape-data.ttl)
