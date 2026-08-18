# Directory Special Remote

## Description

Git-annex directory special remote stores file contents in a local or mounted filesystem directory. The simplest remote type, used for local backups, USB drives, and network-mounted filesystems. Files are stored in a content-addressable directory tree.

## Typical Configuration

- `type=directory`
- `directory=/path/to/annex`
- `encryption=none|shared|hybrid|pubkey`

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | Local Filesystem (LocalFilesystemProtocol) | Direct filesystem access |
| Auth Scheme | No Authentication (NoAuthentication) | OS-level permissions only |
| Operations | Read, Write, Delete, List | Full CRUD + enumeration |
| Delivery Mode | Bulk Delivery (BulkDelivery) | File copy |
| Temporal Quality | Snapshot (Snapshot) | File state at copy time |
| Coverage | Complete (CompleteCoverage) | Full file content |
| Service Quality | Single Host (SingleHost) | Local disk, no redundancy |
| Verification | Hash Verification (HashVerification) | SHA-256 via git-annex |
| Encryption at rest | Optional (GPG) | Client-side if configured |
| Encryption in transit | N/A | No network transfer |

## References

- [git-annex directory special remote](https://git-annex.branchable.com/special_remotes/directory/)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/git-annex-remotes/directory/shape-data.ttl)
