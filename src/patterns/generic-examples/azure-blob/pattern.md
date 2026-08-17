# Azure Blob Storage

## Description

Microsoft Azure Blob Storage for cloud object storage. Stores unstructured data as blobs in containers with tiered access (Hot, Cool, Archive). Accessed via REST API or Azure SDKs. Common for enterprise data lakes, backup, and static content hosting.

## Typical Access Pattern

- URL: `https://<account>.blob.core.windows.net/<container>/<blob>`
- Authentication: Shared Key, SAS token, or Azure AD
- Tiers: Hot (frequent), Cool (infrequent), Archive (rare)
- Redundancy: LRS, ZRS, GRS, RA-GRS

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | HTTP/HTTPS (QUAY_0000004) | Azure Blob REST API |
| Auth Scheme | API Key (QUAY_0000017) | Shared Access Signature or account key |
| Operations | Read, Write, Delete, List | Full CRUD on blobs and containers |
| Delivery Mode | Bulk Delivery (QUAY_0000030) | Complete blob per request |
| Temporal Quality | Snapshot (QUAY_0000036) | Blob snapshots and versioning |
| Coverage | Complete (QUAY_0000040) | Full blob content |
| Service Quality | High Availability (QUAY_0000062) | Azure SLA 99.9%-99.99% |
| Verification | Hash Verification (QUAY_0000066) | Content-MD5 header |
| Encryption at rest | AES-256 | Azure Storage Service Encryption |
| Encryption in transit | TLS 1.2+ | HTTPS enforced |

## References

- [Azure Blob Storage documentation](https://learn.microsoft.com/en-us/azure/storage/blobs/)
- [Azure Blob REST API](https://learn.microsoft.com/en-us/rest/api/storageservices/blob-service-rest-api)
- [Azure storage redundancy](https://learn.microsoft.com/en-us/azure/storage/common/storage-redundancy)

## Ontosphere

Load this pattern in [Ontosphere](http://localhost:5173/) via MCP tools:

```js
loadRdf({url: "https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/generic-examples/azure-blob/shape-data.ttl"})
loadOntology({query: "quay"})
```
