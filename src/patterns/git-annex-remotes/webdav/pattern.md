# WebDAV Special Remote

## Description

Git-annex WebDAV special remote stores file contents on any WebDAV-compatible server. Files are stored using PUT/GET/DELETE operations in a directory hierarchy derived from the git-annex key.

## Typical Configuration

- `type=webdav`
- `url=https://webdav.example.com/annex`
- `encryption=none|shared|hybrid|pubkey`
- `embedcreds=yes` (optional, stores credentials in git repo)

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | WebDAV (QUAY_0000007) | HTTP extension for authoring |
| Auth Scheme | Basic Authentication (QUAY_0000019) | HTTP Basic over TLS |
| Operations | Read, Write, Delete | Standard DAV methods |
| Delivery Mode | Bulk Delivery (QUAY_0000030) | Complete file per request |
| Temporal Quality | Snapshot (QUAY_0000036) | File state at transfer time |
| Coverage | Complete (QUAY_0000040) | Full file content |
| Service Quality | Best Effort (QUAY_0000063) | Depends on WebDAV server |
| Verification | Hash Verification (QUAY_0000066) | SHA-256 via git-annex |
| Encryption at rest | Optional (GPG) | Client-side if configured |
| Encryption in transit | TLS 1.2+ | HTTPS required |

## References

- [git-annex WebDAV special remote](https://git-annex.branchable.com/special_remotes/webdav/)
- [RFC 4918 — HTTP Extensions for Web Distributed Authoring and Versioning](https://www.rfc-editor.org/rfc/rfc4918)

## Ontosphere

Load this pattern in [Ontosphere](http://localhost:5173/) via MCP tools:

```js
loadRdf({url: "https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/git-annex-remotes/webdav/shape-data.ttl"})
loadOntology({query: "quay"})
```
