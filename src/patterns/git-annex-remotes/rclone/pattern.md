# Rclone Special Remote

## Description

Git-annex rclone special remote delegates to rclone, supporting 40+ cloud backends.). Acts as a meta-protocol that abstracts backend-specific APIs.

## Typical Configuration

- `type=external`
- `externaltype=rclone`
- `target=<rclone-remote-name>`
- `prefix=git-annex`
- `encryption=none|shared|hybrid|pubkey`
- `rclone_layout=lower|mixed|nodir`

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | Rclone (RcloneProtocol) | Delegates to rclone backends |
| Auth Scheme | API Key (ApiKeyAuthentication) | Varies per backend, API key typical |
| Operations | Read, Write, Delete | Standard CRUD via rclone |
| Delivery Mode | Bulk Delivery (BulkDelivery) | Complete file per request |
| Temporal Quality | Snapshot (Snapshot) | File state at transfer time |
| Coverage | Complete (CompleteCoverage) | Full file content |
| Service Quality | Best Effort (BestEffort) | Depends on backing service |
| Verification | Hash Verification (HashVerification) | SHA-256 via git-annex |
| Encryption at rest | Optional (GPG) | Client-side if configured |
| Encryption in transit | TLS | Backend-dependent |

## References

- [git-annex rclone special remote](https://github.com/DanielDent/git-annex-remote-rclone)
- [rclone documentation](https://rclone.org/docs/)
- [rclone supported backends](https://rclone.org/overview/)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/git-annex-remotes/rclone/shape-data.ttl)
