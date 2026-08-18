# REST API Data Access

## Description

Paginated JSON REST API serving structured data, typical of government open data portals, scientific data repositories, and SaaS platforms. Clients retrieve data via HTTP GET with pagination parameters, authenticated via OAuth 2.0 bearer tokens.

## Typical Access Pattern

- Base URL: `https://api.example.org/v2/datasets/{id}/records`
- Pagination: `?page=1&per_page=100` or cursor-based `?cursor=abc123`
- Content-Type: `application/json`
- Rate limits: 1000 requests/hour

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | HTTP/HTTPS (HttpProtocol) | RESTful HTTP API |
| Auth Scheme | OAuth 2.0 (OAuth2Authentication) | Bearer token authentication |
| Operations | Read, List | GET endpoints, read-only API |
| Delivery Mode | Paginated Delivery (PaginatedDelivery) | Bounded page size per request |
| Temporal Quality | Real-Time (RealTime) | Live database-backed responses |
| Coverage | Subset (SubsetCoverage) | Filtered/paginated results |
| Service Quality | High Availability (HighAvailability) | SLA-backed API |
| Verification | No Verification (NoVerification) | No content integrity guarantee |
| Encryption in transit | TLS 1.2+ | HTTPS enforced |

## References

- [JSON:API specification](https://jsonapi.org/)
- [OpenAPI specification](https://spec.openapis.org/oas/latest.html)
- [RFC 6749 — OAuth 2.0](https://www.rfc-editor.org/rfc/rfc6749)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/generic-examples/rest-api/shape-data.ttl)
