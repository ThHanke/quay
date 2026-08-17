# CKAN Open Data Portal

## Description

CKAN (Comprehensive Knowledge Archive Network) is the leading open data portal platform used by governments and organisations worldwide. Provides a REST API for searching, browsing, and downloading datasets. Powers data.gov, data.gov.uk, and hundreds of other portals.

## Typical Access Pattern

- API: `https://data.gov/api/3/action/package_search?q=climate`
- Resource download: `https://data.gov/dataset/{id}/resource/{rid}/download/{file}`
- Datastore API: `https://data.gov/api/3/action/datastore_search?resource_id={id}`
- No authentication for public datasets

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | HTTP/HTTPS (QUAY_0000004) | CKAN Action API |
| Auth Scheme | No Authentication (QUAY_0000016) | Public open data |
| Operations | Read, List | Search, browse, download |
| Delivery Mode | Paginated Delivery (QUAY_0000032) | Paginated search results |
| Temporal Quality | Snapshot (QUAY_0000036) | Published dataset versions |
| Coverage | Subset (QUAY_0000041) | Search-filtered results |
| Service Quality | Best Effort (QUAY_0000063) | Government infrastructure |
| Verification | No Verification (QUAY_0000070) | No integrity mechanism |
| Encryption in transit | TLS | HTTPS |

## References

- [CKAN documentation](https://docs.ckan.org/)
- [CKAN API guide](https://docs.ckan.org/en/latest/api/)
- [CKAN instances worldwide](https://ckan.org/showcase)
