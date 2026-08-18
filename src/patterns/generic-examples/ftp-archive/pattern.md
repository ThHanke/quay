# FTP Archive

## Description

Classic FTP server hosting static file archives, common in academic institutions, mirror networks, and legacy data repositories. Clients connect via FTP or FTPS to browse directories and download files. Typically anonymous read-only access with optional authenticated upload.

## Typical Access Pattern

- URL: `ftp://ftp.example.edu/pub/datasets/`
- Anonymous login: `ftp / anonymous`
- Directory listing via `LIST`/`MLSD`
- Binary transfer via `RETR`

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | FTP (FtpProtocol) | File Transfer Protocol |
| Auth Scheme | No Authentication (NoAuthentication) | Anonymous FTP |
| Operations | Read, List | Download and directory listing |
| Delivery Mode | Bulk Delivery (BulkDelivery) | Complete file per transfer |
| Temporal Quality | Archived (Archived) | Static archive, infrequent updates |
| Coverage | Complete (CompleteCoverage) | Full file content |
| Service Quality | Best Effort (BestEffort) | University infrastructure |
| Verification | No Verification (NoVerification) | No built-in integrity check |
| Encryption in transit | None (NoEncryption) | Plain FTP, no TLS |

## Features Demonstrated

- Explicit `NoEncryption` marking (contrast with TLS-protected examples)
- Minimal pattern — no ODRL, no SQ metrics, no retention
- Shows that QUAY properties are optional and progressively adoptable

## References

- [RFC 959 — File Transfer Protocol](https://www.rfc-editor.org/rfc/rfc959)
- [RFC 4217 — FTP over TLS](https://www.rfc-editor.org/rfc/rfc4217)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/generic-examples/ftp-archive/shape-data.ttl)
