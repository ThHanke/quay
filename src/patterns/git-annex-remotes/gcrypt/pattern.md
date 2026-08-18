# Gcrypt Remote (Core)

## Description

Git-annex gcrypt remote provides GPG-encrypted git repository on untrusted hosts. The remote appears as a regular git remote but all data is encrypted before push and decrypted on fetch. Suitable for storing repositories on untrusted hosts.

## Typical Configuration

- `git remote add encrypted gcrypt::ssh://user@host/path/to/repo`
- `git config remote.encrypted.gcrypt-participants "KEY-ID"`
- `git annex initremote encrypted type=gcrypt gitrepo=ssh://user@host/path encryption=hybrid keyid=KEY-ID`

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | Git (GitProtocol) | git-remote-gcrypt over SSH |
| Auth Scheme | GPG Key (GpgKeyAuthentication) | GPG key pair for encryption + SSH for transport |
| Operations | Read, Write, Delete, Replicate | Full CRUD + sync |
| Delivery Mode | Bulk Delivery (BulkDelivery) | Complete encrypted packfile |
| Temporal Quality | Versioned (Versioned) | Full git history, encrypted |
| Coverage | Complete (CompleteCoverage) | Full repository content |
| Service Quality | Best Effort (BestEffort) | Depends on hosting |
| Verification | Digital Signature (DigitalSignature) | GPG-signed commits and encryption |
| Encryption at rest | GPG (OpenPGP) | Full repository encrypted |
| Encryption in transit | SSH | SSH tunnel |

## References

- [git-annex gcrypt remote](https://git-annex.branchable.com/special_remotes/gcrypt/)
- [git-remote-gcrypt](https://spwhitton.name/tech/code/git-remote-gcrypt/)
- [GnuPG documentation](https://gnupg.org/documentation/)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/git-annex-remotes/gcrypt/shape-data.ttl)
