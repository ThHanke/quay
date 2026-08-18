# S3 Special Remote

## Description

Git-annex S3 special remote stores file contents in any S3-compatible object storage service (Amazon S3, MinIO, Wasabi, etc.). Files are stored as objects keyed by their git-annex key, typically in a single configurable bucket.

## Typical Configuration

- `type=S3`
- `encryption=none|shared|hybrid|pubkey`
- `bucket=<bucket-name>`
- `host=<s3-compatible-endpoint>` (optional, for non-AWS)
- `port=<port>` (optional)
- `protocol=https`
- `requeststyle=path|virtualhost`

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | S3 (S3Protocol) | S3 REST API |
| Auth Scheme | AWS Credential (AwsCredentialAuthentication) | Access key + secret key |
| Operations | Read, Write, Delete, List | Full CRUD + enumeration |
| Delivery Mode | Bulk Delivery (BulkDelivery) | Complete object per request |
| Temporal Quality | Snapshot (Snapshot) | Point-in-time object state |
| Coverage | Complete (CompleteCoverage) | Full file content per object |
| Service Quality | High Availability (HighAvailability) | AWS SLA 99.99% |
| Verification | Hash Verification (HashVerification) | SHA-256 via git-annex |
| Encryption at rest | AES-256 (SSE) | Server-side or client-side |
| Encryption in transit | TLS 1.2+ | HTTPS enforced |

## References

- [git-annex S3 special remote](https://git-annex.branchable.com/special_remotes/S3/)
- [Amazon S3 API Reference](https://docs.aws.amazon.com/AmazonS3/latest/API/)
- [git-annex encryption](https://git-annex.branchable.com/encryption/)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/git-annex-remotes/s3/shape-data.ttl)
