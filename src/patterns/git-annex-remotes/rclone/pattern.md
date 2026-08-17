# Rclone Special Remote

## Description

Git-annex rclone special remote delegates storage operations to the rclone tool, which supports over 40 cloud storage backends (Google Drive, Dropbox, OneDrive, Backblaze B2, etc.). Acts as a meta-protocol that abstracts backend-specific APIs.

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
| Protocol | Rclone (QUAY_0000012) | Delegates to rclone backends |
| Auth Scheme | API Key (QUAY_0000017) | Varies per backend, API key typical |
| Operations | Read, Write, Delete | Standard CRUD via rclone |
| Delivery Mode | Bulk Delivery (QUAY_0000030) | Complete file per request |
| Temporal Quality | Snapshot (QUAY_0000036) | File state at transfer time |
| Coverage | Complete (QUAY_0000040) | Full file content |
| Service Quality | Best Effort (QUAY_0000063) | Depends on backing service |
| Verification | Hash Verification (QUAY_0000066) | SHA-256 via git-annex |
| Encryption at rest | Optional (GPG) | Client-side if configured |
| Encryption in transit | TLS | Backend-dependent |

## References

- [git-annex rclone special remote](https://github.com/DanielDent/git-annex-remote-rclone)
- [rclone documentation](https://rclone.org/docs/)
- [rclone supported backends](https://rclone.org/overview/)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/git-annex-remotes/rclone/shape-data.ttl)
