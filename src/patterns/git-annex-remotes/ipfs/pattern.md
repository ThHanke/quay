# IPFS Special Remote

## Description

Git-annex IPFS special remote stores and retrieves file contents on the InterPlanetary File System. Content is addressed by its cryptographic hash (CID), providing inherent deduplication and integrity verification. Supports both adding content to IPFS and retrieving by CID.

## Typical Configuration

- `type=external`
- `externaltype=ipfs`
- IPFS daemon must be running locally
- Content pinned to ensure persistence

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | IPFS (QUAY_0000010) | Content-addressed P2P network |
| Auth Scheme | No Authentication (QUAY_0000016) | Open network, CID-based access |
| Operations | Read, Write | Add and retrieve by CID |
| Delivery Mode | Peer-to-Peer Delivery (QUAY_0000061) | Block exchange across peers |
| Temporal Quality | Versioned (QUAY_0000038) | Immutable CIDs, IPNS for mutability |
| Coverage | Complete (QUAY_0000040) | Full content per CID |
| Service Quality | Distributed (QUAY_0000065) | DHT-based, depends on pinning |
| Verification | Content Addressing (QUAY_0000067) | CID = hash of content |
| Encryption at rest | none | Content public by default |
| Encryption in transit | Optional | libp2p transport encryption |

## References

- [git-annex IPFS integration](https://git-annex.branchable.com/tips/using_the_IPFS_special_remote/)
- [IPFS documentation](https://docs.ipfs.tech/)
- [Content Identifiers (CID) specification](https://github.com/multiformats/cid)

## Ontosphere

Load this pattern in [Ontosphere](http://localhost:5173/) via MCP tools:

```js
loadRdf({url: "https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/git-annex-remotes/ipfs/shape-data.ttl"})
loadOntology({query: "quay"})
```
