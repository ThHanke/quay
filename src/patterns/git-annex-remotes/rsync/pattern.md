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
| Protocol | Rsync (QUAY_0000006) | rsync over SSH tunnel |
| Auth Scheme | SSH Key (QUAY_0000020) | SSH key pair authentication |
| Operations | Read, Write, Delete | No native enumeration |
| Delivery Mode | Bulk Delivery (QUAY_0000030) | Delta-transfer optimised |
| Temporal Quality | Snapshot (QUAY_0000036) | File state at transfer time |
| Coverage | Complete (QUAY_0000040) | Full file content |
| Service Quality | Best Effort (QUAY_0000063) | Depends on remote host |
| Verification | Hash Verification (QUAY_0000066) | SHA-256 via git-annex |
| Encryption at rest | Optional (GPG) | Client-side if configured |
| Encryption in transit | SSH | SSH tunnel |

## References

- [git-annex rsync special remote](https://git-annex.branchable.com/special_remotes/rsync/)
- [rsync documentation](https://rsync.samba.org/documentation.html)
