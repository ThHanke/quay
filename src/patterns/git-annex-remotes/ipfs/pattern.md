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
| Protocol | IPFS (IpfsProtocol) | Content-addressed P2P network |
| Auth Scheme | No Authentication (NoAuthentication) | Open network, CID-based access |
| Operations | Read, Write | Add and retrieve by CID |
| Delivery Mode | Peer-to-Peer Delivery (PeerToPeerDelivery) | Block exchange across peers |
| Temporal Quality | Versioned (Versioned) | Immutable CIDs, IPNS for mutability |
| Coverage | Complete (CompleteCoverage) | Full content per CID |
| Service Quality | Distributed (Distributed) | DHT-based, depends on pinning |
| Verification | Content Addressing (ContentAddressing) | CID = hash of content |
| Encryption at rest | none | Content public by default |
| Encryption in transit | Optional | libp2p transport encryption |

## References

- [git-annex IPFS integration](https://git-annex.branchable.com/tips/using_the_IPFS_special_remote/)
- [IPFS documentation](https://docs.ipfs.tech/)
- [Content Identifiers (CID) specification](https://github.com/multiformats/cid)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/git-annex-remotes/ipfs/shape-data.ttl)
