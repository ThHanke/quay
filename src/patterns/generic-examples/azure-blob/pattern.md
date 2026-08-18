# Azure Blob Storage

## Description

Microsoft Azure cloud object storage. Stores unstructured data as blobs in containers with tiered access (Hot, Cool, Archive). Accessed via REST API or Azure SDKs. Common for enterprise data lakes, backup, and static content hosting.

## Typical Access Pattern

- URL: `https://<account>.blob.core.windows.net/<container>/<blob>`
- Authentication: Shared Key, SAS token, or Azure AD
- Tiers: Hot (frequent), Cool (infrequent), Archive (rare)
- Redundancy: LRS, ZRS, GRS, RA-GRS

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | HTTP/HTTPS (HttpProtocol) | Azure Blob REST API |
| Auth Scheme | API Key (ApiKeyAuthentication) | Shared Access Signature or account key |
| Operations | Read, Write, Delete, List | Full CRUD on blobs and containers |
| Delivery Mode | Bulk Delivery (BulkDelivery) | Complete blob per request |
| Temporal Quality | Snapshot (Snapshot) | Blob snapshots and versioning |
| Coverage | Complete (CompleteCoverage) | Full blob content |
| Service Quality | High Availability (HighAvailability) | Azure SLA 99.9%-99.99% |
| Verification | Hash Verification (HashVerification) | Content-MD5 header |
| Encryption at rest | AES-256 | Azure Storage Service Encryption |
| Encryption in transit | TLS 1.2+ | HTTPS enforced |
| Retention | 7 years | Compliance retention period |
| Jurisdiction | Germany (DEU) | EU data residency |
| Uptime | 99.99% | Azure SLA |
| Replication | 3x | Geo-redundant storage |
| ODRL Policy | Read permitted, Write geo-constrained to DEU | Data sovereignty enforcement |

## Features Demonstrated

- ODRL geographic constraint (`odrl:spatial` + `odrl:eq`)
- Storage jurisdiction via EU authority URI
- Retention period (`xsd:duration`)
- Service quality metrics (uptime, replication)

## References

- [Azure Blob Storage documentation](https://learn.microsoft.com/en-us/azure/storage/blobs/)
- [Azure Blob REST API](https://learn.microsoft.com/en-us/rest/api/storageservices/blob-service-rest-api)
- [Azure storage redundancy](https://learn.microsoft.com/en-us/azure/storage/common/storage-redundancy)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/generic-examples/azure-blob/shape-data.ttl)
