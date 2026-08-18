# Zenodo Research Data Repository

## Description

Zenodo is a general-purpose open research data repository operated by CERN. Researchers deposit datasets, software, and publications with persistent DOI identifiers. Each deposit is versioned and immutable once published. Access via REST API with optional API key authentication for uploads.

## Typical Access Pattern

- Download: `https://zenodo.org/records/{id}/files/{filename}`
- API: `https://zenodo.org/api/records/{id}`
- Upload: `POST https://zenodo.org/api/deposit/depositions` with API key
- DOI resolution: `https://doi.org/10.5281/zenodo.{id}`

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | HTTP/HTTPS (HttpProtocol) | REST API and file download |
| Auth Scheme | API Key (ApiKeyAuthentication) | Bearer token for uploads, public read |
| Operations | Read, Write, List | Download, deposit, search |
| Delivery Mode | Bulk Delivery (BulkDelivery) | Complete file download |
| Temporal Quality | Versioned (Versioned) | DOI versioning, immutable records |
| Coverage | Complete (CompleteCoverage) | Full deposited content |
| Service Quality | High Availability (HighAvailability) | CERN infrastructure |
| Verification | Hash Verification (HashVerification) | MD5/SHA-256 checksums provided |
| Encryption in transit | TLS 1.2+ | HTTPS enforced |

## References

- [Zenodo REST API](https://developers.zenodo.org/)
- [Zenodo about page](https://about.zenodo.org/)
- [DOI system](https://www.doi.org/)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/generic-examples/zenodo/shape-data.ttl)
