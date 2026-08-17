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
| Protocol | Local Filesystem (QUAY_0000011) | Direct filesystem access |
| Auth Scheme | No Authentication (QUAY_0000016) | OS-level permissions only |
| Operations | Read, Write, Delete, List | Full CRUD + enumeration |
| Delivery Mode | Bulk Delivery (QUAY_0000030) | File copy |
| Temporal Quality | Snapshot (QUAY_0000036) | File state at copy time |
| Coverage | Complete (QUAY_0000040) | Full file content |
| Service Quality | Single Host (QUAY_0000064) | Local disk, no redundancy |
| Verification | Hash Verification (QUAY_0000066) | SHA-256 via git-annex |
| Encryption at rest | Optional (GPG) | Client-side if configured |
| Encryption in transit | N/A | No network transfer |

## References

- [git-annex directory special remote](https://git-annex.branchable.com/special_remotes/directory/)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/git-annex-remotes/directory/shape-data.ttl)
