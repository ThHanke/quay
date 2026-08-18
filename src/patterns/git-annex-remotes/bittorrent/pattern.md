# BitTorrent Special Remote

## Description

Git-annex BitTorrent special remote retrieves files from BitTorrent swarms using magnet links or .torrent files. Read-only — content is downloaded from distributed peers. Torrent metadata is registered via `git annex addurl`.

## Typical Configuration

No explicit remote configuration. BitTorrent support built into git-annex.

- Requires `aria2c` for torrent downloading
- Torrent/magnet URLs added via `git annex addurl`

## QUAY Mapping

| Dimension | QUAY Class | Notes |
|-----------|-----------|-------|
| Protocol | BitTorrent (BitTorrentProtocol) | Peer-to-peer file sharing |
| Auth Scheme | No Authentication (NoAuthentication) | Open swarm participation |
| Operations | Read | Download from swarm only |
| Delivery Mode | Peer-to-Peer Delivery (PeerToPeerDelivery) | Pieces from multiple peers |
| Temporal Quality | Snapshot (Snapshot) | Immutable torrent content |
| Coverage | Complete (CompleteCoverage) | Full torrent content |
| Service Quality | Distributed (Distributed) | Depends on swarm health |
| Verification | Piece Verification (PieceVerification) | SHA-1 hash tree per piece |
| Encryption at rest | none | No storage encryption |
| Encryption in transit | Optional | Protocol encryption if enabled |

## References

- [git-annex BitTorrent support](https://git-annex.branchable.com/tips/using_the_web_as_a_special_remote/)
- [BitTorrent protocol specification (BEP 3)](https://www.bittorrent.org/beps/bep_0003.html)
- [aria2 documentation](https://aria2.github.io/)

## Ontosphere

[Open in Ontosphere](https://thhanke.github.io/ontosphere/?rdfUrl=https://raw.githubusercontent.com/ThHanke/quay/main/src/patterns/git-annex-remotes/bittorrent/shape-data.ttl)
