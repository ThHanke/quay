# Hook Special Remote

## Description

Git-annex hook special remote delegates all storage operations to user-defined shell commands. Fully configurable — the user provides scripts for store, retrieve, remove, and checkpresent. Used for integrating with unsupported storage backends or custom workflows.

## Typical Configuration

- `type=hook`
- `hooktype=<name>`
- `encryption=none|shared|hybrid|pubkey`

Hook commands configured via git-annex config:
- `annex.hook.<name>-store` — command to store content
- `annex.hook.<name>-retrieve` — command to retrieve content
- `annex.hook.<name>-remove` — command to remove content
- `annex.hook.<name>-checkpresent` — command to check if content exists

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | Hook (QUAY_0000071) | User-defined scripts |
| Auth Scheme | (varies) | Determined by hook implementation |
| Operations | (varies) | Determined by which hooks are defined |
| Delivery Mode | Bulk Delivery (QUAY_0000030) | Typical for file-based hooks |
| Temporal Quality | Snapshot (QUAY_0000036) | State at hook execution time |
| Coverage | Complete (QUAY_0000040) | Full file per hook invocation |
| Service Quality | Best Effort (QUAY_0000063) | Depends on hook implementation |
| Verification | Hash Verification (QUAY_0000066) | SHA-256 via git-annex |
| Encryption at rest | Optional (GPG) | Client-side if configured |
| Encryption in transit | Hook-dependent | Determined by transport in script |

## References

- [git-annex hook special remote](https://git-annex.branchable.com/special_remotes/hook/)
- [git-annex external special remote protocol](https://git-annex.branchable.com/design/external_special_remote_protocol/)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/git-annex-remotes/hook/shape-data.ttl)
