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
| Protocol | HTTP/HTTPS (QUAY_0000004) | Standard HTTP GET |
| Auth Scheme | No Authentication (QUAY_0000016) | Public URLs |
| Operations | Read | Download only |
| Delivery Mode | Bulk Delivery (QUAY_0000030) | Complete file download |
| Temporal Quality | Snapshot (QUAY_0000036) | State at download time, URL may change |
| Coverage | Complete (QUAY_0000040) | Full file per URL |
| Service Quality | Best Effort (QUAY_0000063) | URL availability not guaranteed |
| Verification | No Verification (QUAY_0000070) | URL content may change without notice |
| Encryption at rest | none | Public web content |
| Encryption in transit | TLS | HTTPS when available |

## References

- [git-annex web special remote](https://git-annex.branchable.com/special_remotes/web/)
- [git-annex addurl](https://git-annex.branchable.com/git-annex-addurl/)

## Ontosphere

Load this pattern in [Ontosphere](http://localhost:5173/) via MCP tools:

```js
loadRdf({url: "https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/git-annex-remotes/web/shape-data.ttl"})
loadOntology({query: "quay"})
```
