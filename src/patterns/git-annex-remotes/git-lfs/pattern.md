# Git LFS Special Remote

## Description

Git-annex git-lfs special remote interoperates with Git Large File Storage servers. Allows git-annex to push and pull content from any Git LFS-compatible endpoint (GitHub, GitLab, Gitea, etc.). Uses the Git LFS batch API over HTTP/HTTPS with token-based authentication.

## Typical Configuration

- `type=git-lfs`
- `url=https://github.com/user/repo.git`
- Authentication via git credential helper or environment variables

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | HTTP/HTTPS (QUAY_0000004) | Git LFS batch API |
| Auth Scheme | OAuth 2.0 (QUAY_0000018) | Token-based via git credential |
| Operations | Read, Write, Delete | Upload, download, delete objects |
| Delivery Mode | Bulk Delivery (QUAY_0000030) | Complete object per request |
| Temporal Quality | Versioned (QUAY_0000038) | Git-tracked object versions |
| Coverage | Complete (QUAY_0000040) | Full file content per object |
| Service Quality | Best Effort (QUAY_0000063) | Depends on hosting provider |
| Verification | Hash Verification (QUAY_0000066) | SHA-256 OID |
| Encryption at rest | Provider-dependent | Server-side encryption |
| Encryption in transit | TLS 1.2+ | HTTPS enforced |

## References

- [git-annex git-lfs special remote](https://git-annex.branchable.com/special_remotes/git-lfs/)
- [Git LFS specification](https://github.com/git-lfs/git-lfs/blob/main/docs/spec.md)
- [Git LFS batch API](https://github.com/git-lfs/git-lfs/blob/main/docs/api/batch.md)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/git-annex-remotes/git-lfs/shape-data.ttl)
