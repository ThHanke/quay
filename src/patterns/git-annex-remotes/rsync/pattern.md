# Rsync Special Remote

## Description

Git-annex rsync special remote stores file contents on any host accessible via rsync over SSH. Files are stored in a directory tree structure derived from the git-annex key, preserving the content-addressable layout.

## Typical Configuration

- `type=rsync`
- `rsyncurl=user@host:/path/to/annex`
- `encryption=none|shared|hybrid|pubkey`
- `shellescape=yes` (default)

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | Rsync (RsyncProtocol) | rsync over SSH tunnel |
| Auth Scheme | SSH Key (SshKeyAuthentication) | SSH key pair authentication |
| Operations | Read, Write, Delete | No native enumeration |
| Delivery Mode | Bulk Delivery (BulkDelivery) | Delta-transfer optimised |
| Temporal Quality | Snapshot (Snapshot) | File state at transfer time |
| Coverage | Complete (CompleteCoverage) | Full file content |
| Service Quality | Best Effort (BestEffort) | Depends on remote host |
| Verification | Hash Verification (HashVerification) | SHA-256 via git-annex |
| Encryption at rest | Optional (GPG) | Client-side if configured |
| Encryption in transit | SSH | SSH tunnel |

## References

- [git-annex rsync special remote](https://git-annex.branchable.com/special_remotes/rsync/)
- [rsync documentation](https://rsync.samba.org/documentation.html)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/git-annex-remotes/rsync/shape-data.ttl)
