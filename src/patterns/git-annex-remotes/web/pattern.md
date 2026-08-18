# Web Special Remote

## Description

Git-annex web special remote retrieves files from arbitrary HTTP/HTTPS URLs. Read-only by nature — URLs are registered via `git annex addurl` or `git annex registerurl`. Supports multiple URLs per key for redundancy.

## Typical Configuration

No explicit configuration needed. Built-in remote type.

- URLs registered per key via `git annex addurl`
- `git annex setpresentkey` for manual presence tracking

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | HTTP/HTTPS (HttpProtocol) | Standard HTTP GET |
| Auth Scheme | No Authentication (NoAuthentication) | Public URLs |
| Operations | Read | Download only |
| Delivery Mode | Bulk Delivery (BulkDelivery) | Complete file download |
| Temporal Quality | Snapshot (Snapshot) | State at download time, URL may change |
| Coverage | Complete (CompleteCoverage) | Full file per URL |
| Service Quality | Best Effort (BestEffort) | URL availability not guaranteed |
| Verification | No Verification (NoVerification) | URL content may change without notice |
| Encryption at rest | none | Public web content |
| Encryption in transit | TLS | HTTPS when available |

## References

- [git-annex web special remote](https://git-annex.branchable.com/special_remotes/web/)
- [git-annex addurl](https://git-annex.branchable.com/git-annex-addurl/)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/git-annex-remotes/web/shape-data.ttl)
