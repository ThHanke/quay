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
| Protocol | WebDAV (WebDavProtocol) | HTTP extension for authoring |
| Auth Scheme | Basic Authentication (BasicAuthentication) | HTTP Basic over TLS |
| Operations | Read, Write, Delete | Standard DAV methods |
| Delivery Mode | Bulk Delivery (BulkDelivery) | Complete file per request |
| Temporal Quality | Snapshot (Snapshot) | File state at transfer time |
| Coverage | Complete (CompleteCoverage) | Full file content |
| Service Quality | Best Effort (BestEffort) | Depends on WebDAV server |
| Verification | Hash Verification (HashVerification) | SHA-256 via git-annex |
| Encryption at rest | Optional (GPG) | Client-side if configured |
| Encryption in transit | TLS 1.2+ | HTTPS required |

## References

- [git-annex WebDAV special remote](https://git-annex.branchable.com/special_remotes/webdav/)
- [RFC 4918 — HTTP Extensions for Web Distributed Authoring and Versioning](https://www.rfc-editor.org/rfc/rfc4918)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/git-annex-remotes/webdav/shape-data.ttl)
