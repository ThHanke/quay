# Gcrypt Remote (Core)

## Description

Git-annex gcrypt remote uses git-remote-gcrypt to store an entire git repository (including annexed content) in GPG-encrypted form. The remote appears as a regular git remote but all data is encrypted before push and decrypted on fetch. Suitable for storing repositories on untrusted hosts.

## Typical Configuration

- `git remote add encrypted gcrypt::ssh://user@host/path/to/repo`
- `git config remote.encrypted.gcrypt-participants "KEY-ID"`
- `git annex initremote encrypted type=gcrypt gitrepo=ssh://user@host/path encryption=hybrid keyid=KEY-ID`

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | Git (QUAY_0000014) | git-remote-gcrypt over SSH |
| Auth Scheme | GPG Key (QUAY_0000021) | GPG key pair for encryption + SSH for transport |
| Operations | Read, Write, Delete, Replicate | Full CRUD + sync |
| Delivery Mode | Bulk Delivery (QUAY_0000030) | Complete encrypted packfile |
| Temporal Quality | Versioned (QUAY_0000038) | Full git history, encrypted |
| Coverage | Complete (QUAY_0000040) | Full repository content |
| Service Quality | Best Effort (QUAY_0000063) | Depends on hosting |
| Verification | Digital Signature (QUAY_0000069) | GPG-signed commits and encryption |
| Encryption at rest | GPG (OpenPGP) | Full repository encrypted |
| Encryption in transit | SSH | SSH tunnel |

## References

- [git-annex gcrypt remote](https://git-annex.branchable.com/special_remotes/gcrypt/)
- [git-remote-gcrypt](https://spwhitton.name/tech/code/git-remote-gcrypt/)
- [GnuPG documentation](https://gnupg.org/documentation/)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/git-annex-remotes/gcrypt/shape-data.ttl)
