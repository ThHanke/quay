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
| Protocol | FTP (QUAY_0000013) | File Transfer Protocol |
| Auth Scheme | No Authentication (QUAY_0000016) | Anonymous FTP |
| Operations | Read, List | Download and directory listing |
| Delivery Mode | Bulk Delivery (QUAY_0000030) | Complete file per transfer |
| Temporal Quality | Archived (QUAY_0000037) | Static archive, infrequent updates |
| Coverage | Complete (QUAY_0000040) | Full file content |
| Service Quality | Best Effort (QUAY_0000063) | University infrastructure |
| Verification | No Verification (QUAY_0000070) | No built-in integrity check |
| Encryption in transit | none | Plain FTP (FTPS optional) |

## References

- [RFC 959 — File Transfer Protocol](https://www.rfc-editor.org/rfc/rfc959)
- [RFC 4217 — FTP over TLS](https://www.rfc-editor.org/rfc/rfc4217)

## Ontosphere

Load this pattern in [Ontosphere](http://localhost:5173/) via MCP tools:

```js
loadRdf({url: "https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/generic-examples/ftp-archive/shape-data.ttl"})
loadOntology({query: "quay"})
```
