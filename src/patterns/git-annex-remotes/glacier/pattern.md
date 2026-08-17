# Glacier Special Remote

## Description

Git-annex glacier special remote stores file contents in Amazon S3 Glacier or Glacier Deep Archive storage classes. Optimised for long-term archival with low storage cost but high retrieval latency (minutes to hours). Uses the S3 API with Glacier storage class selection.

## Typical Configuration

- `type=glacier`
- `datacenter=<aws-region>`
- `encryption=none|shared|hybrid|pubkey`
- `vault=<vault-name>` (legacy Glacier API)

Modern approach uses S3 remote with storage class:
- `type=S3`
- `storageclass=GLACIER|DEEP_ARCHIVE`

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | S3 (QUAY_0000005) | S3-compatible API with Glacier class |
| Auth Scheme | AWS Credential (QUAY_0000022) | Access key + secret key |
| Operations | Read, Write, Delete | Retrieval requires restore request |
| Delivery Mode | Bulk Delivery (QUAY_0000030) | Complete object after restore |
| Temporal Quality | Archived (QUAY_0000037) | Long-term cold storage |
| Coverage | Complete (QUAY_0000040) | Full file content |
| Service Quality | High Availability (QUAY_0000062) | AWS 99.999999999% durability |
| Verification | Hash Verification (QUAY_0000066) | SHA-256 |
| Encryption at rest | AES-256 (SSE) | Server-side encryption |
| Encryption in transit | TLS 1.2+ | HTTPS enforced |

## References

- [git-annex glacier special remote](https://git-annex.branchable.com/special_remotes/glacier/)
- [Amazon S3 Glacier documentation](https://docs.aws.amazon.com/amazonglacier/latest/dev/)
- [S3 storage classes](https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage-class-intro.html)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/git-annex-remotes/glacier/shape-data.ttl)
