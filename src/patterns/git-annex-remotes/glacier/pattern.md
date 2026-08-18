# Glacier Special Remote

## Description

Git-annex glacier special remote stores files in Amazon S3 Glacier or Deep Archive. Optimised for long-term archival with low storage cost but high retrieval latency (minutes to hours). Uses the S3 API with Glacier storage class selection.

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
| Protocol | S3 (S3Protocol) | S3-compatible API with Glacier class |
| Auth Scheme | AWS Credential (AwsCredentialAuthentication) | Access key + secret key |
| Operations | Read, Write, Delete | Retrieval requires restore request |
| Delivery Mode | Bulk Delivery (BulkDelivery) | Complete object after restore |
| Temporal Quality | Archived (Archived) | Long-term cold storage |
| Coverage | Complete (CompleteCoverage) | Full file content |
| Service Quality | High Availability (HighAvailability) | AWS 99.999999999% durability |
| Verification | Hash Verification (HashVerification) | SHA-256 |
| Encryption at rest | AES-256 (SSE) | Server-side encryption |
| Encryption in transit | TLS 1.2+ | HTTPS enforced |
| Retention | 99 years | Long-term archival |
| Jurisdiction | USA | AWS region constraint |
| Uptime | 99.99% | AWS Glacier SLA |
| RTO | 12 hours | Glacier restore latency |
| RPO | 1 hour | Replication lag |
| Replication | 3x | Cross-AZ |
| ODRL Policy | Read geo-constrained, Write permitted, Delete prohibited | Archival protection |

## Features Demonstrated

- ODRL geographic constraint (`odrl:spatial` + `odrl:eq`)
- ODRL prohibition (delete blocked for archival integrity)
- Full service quality metrics (uptime, RTO, RPO, replication)
- Storage jurisdiction, retention period
- SPDX checksum

## References

- [git-annex glacier special remote](https://git-annex.branchable.com/special_remotes/glacier/)
- [Amazon S3 Glacier documentation](https://docs.aws.amazon.com/amazonglacier/latest/dev/)
- [S3 storage classes](https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage-class-intro.html)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/git-annex-remotes/glacier/shape-data.ttl)
