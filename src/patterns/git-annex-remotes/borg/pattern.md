# Borg Special Remote

## Description

Git-annex borg special remote stores file contents in a BorgBackup repository. Borg provides deduplication, compression, and authenticated encryption. Typically accessed over SSH to a single backup host. Each git-annex key is stored as an individual Borg archive.

## Typical Configuration

- `type=external`
- `externaltype=borg`
- `borgrepo=ssh://user@host/path/to/repo`
- `encryption=repokey|keyfile|none`
- `compression=lz4|zstd|zlib|lzma|none`

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | SSH/SFTP (SshProtocol) | SSH tunnel to Borg server |
| Auth Scheme | SSH Key (SshKeyAuthentication) | SSH key pair authentication |
| Operations | Read, Write, Delete | Archive create, extract, delete |
| Delivery Mode | Bulk Delivery (BulkDelivery) | Complete archive per operation |
| Temporal Quality | Versioned (Versioned) | Borg maintains archive history |
| Coverage | Complete (CompleteCoverage) | Full file content per archive |
| Service Quality | Single Host (SingleHost) | Single Borg server, no replication |
| Verification | Hash Verification (HashVerification) | HMAC-SHA-256 integrity |
| Encryption at rest | AES-256-CTR | Borg authenticated encryption |
| Encryption in transit | SSH | SSH tunnel |

## References

- [git-annex borg special remote](https://git-annex.branchable.com/special_remotes/borg/)
- [BorgBackup documentation](https://borgbackup.readthedocs.io/)
- [Borg security model](https://borgbackup.readthedocs.io/en/stable/internals/security.html)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/git-annex-remotes/borg/shape-data.ttl)
