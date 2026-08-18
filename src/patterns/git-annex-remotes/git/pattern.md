# Git Remote (Core)

## Description

Standard git remote with git-annex enabled. Content is transferred between repositories using git-annex's own protocol layered over SSH or HTTPS. The most common remote type — every cloned git-annex repository is automatically a git remote. Supports both bare and non-bare repositories.

## Typical Configuration

No special configuration needed. Any git remote with git-annex initialized:

- `git remote add origin user@host:/path/to/repo.git`
- `git annex sync`
- Trust level set via `git annex trust`, `git annex semitrust`, `git annex untrust`

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | Git (GitProtocol) | git-annex over SSH or HTTPS |
| Auth Scheme | SSH Key (SshKeyAuthentication) | SSH key pair (most common) |
| Operations | Read, Write, Delete, Replicate | Full CRUD + git-annex sync |
| Delivery Mode | Bulk Delivery (BulkDelivery) | Complete file per transfer |
| Temporal Quality | Versioned (Versioned) | Full git history |
| Coverage | Complete (CompleteCoverage) | Full file content |
| Service Quality | Best Effort (BestEffort) | Depends on hosting |
| Verification | Hash Verification (HashVerification) | SHA-256 via git-annex key |
| Encryption at rest | none | Git repository, no encryption layer |
| Encryption in transit | SSH | SSH tunnel or HTTPS |

## References

- [git-annex walkthrough](https://git-annex.branchable.com/walkthrough/)
- [git-annex sync](https://git-annex.branchable.com/git-annex-sync/)
- [git-annex trust](https://git-annex.branchable.com/trust/)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/git-annex-remotes/git/shape-data.ttl)
