---
date: 2026-08-17
topic: quay-ontology-design
---

# QUAY Ontology Design — Qualified Usage, Access and Yield

## Problem Frame

DCAT (W3C Data Catalog Vocabulary) describes datasets, distributions, and data services — but leaves critical access metadata unqualified. You know THAT a dataset has a distribution, but not HOW to actually retrieve it, WHAT you'll get back, or WHO is authorized to do WHAT.

QUAY is a DCAT profile that fills these three gaps as a general-purpose ontology for **all data access**, not specific to any single tool or platform. Git-annex special remotes serve as validation use cases because they already deal with the same domain (storage backends, access protocols, replication, trust) without a formal ontology.

**Namespace:** `https://w3id.org/quay/`
**Imports:** DCAT, dcterms, ODRL

## Requirements

**Core Architecture**

- R1. QUAY extends DCAT — not replaces. Dataset → Distribution → DataService chain stays. QUAY adds qualification nodes that describe access, yield, and usage on these existing resources.
- R2. Three pillars mapping to the name Q-U-A-Y:
  - **Usage (U)** — WHO can do WHAT. Bridges to ODRL. QUAY defines domain-specific Actions and Constraints.
  - **Access (A)** — HOW you reach data. New class `quay:AccessDescription` qualifies the relationship between Distribution and DataService.
  - **Yield (Y)** — WHAT you get back. New class `quay:YieldDescription` describes delivery characteristics.
- R3. The model must be composable — you can describe access without yield details, or yield without auth policies. Each pillar is independent.

**Access (A) — AccessDescription**

- R4. `quay:AccessDescription` is a class that qualifies how a Distribution is reached via a DataService. Key properties:
  - `quay:protocol` → instance of `quay:Protocol` class hierarchy
  - `quay:authScheme` → instance of `quay:AuthScheme` class hierarchy
  - `quay:operation` → instance(s) of `quay:Operation` class hierarchy
- R5. Protocol, AuthScheme, and Operation are OWL classes with subclass hierarchies — not external controlled vocabularies.
- R6. Protocol subclasses (initial): S3, HTTP/HTTPS, rsync, WebDAV, SSH/SFTP, BitTorrent, IPFS, FTP, Git.
- R7. AuthScheme subclasses (initial): NoAuth, APIKey, OAuth2, BasicAuth, SSHKey, GPGKey, AWSCredential.
- R8. Operation subclasses (initial): Read, Write, Delete, List, Replicate.

**Yield (Y) — YieldDescription**

- R9. `quay:YieldDescription` is a class that qualifies what a Distribution delivers. Five dimensions (all included in draft, prune after git-annex mapping):
  1. **Delivery Mode** — Bulk, Streaming, Paginated, EventDriven, Synchronous
  2. **Temporal Quality** — freshness (real-time, snapshot, archived), update frequency, latency
  3. **Coverage** — Complete, Subset, Sample, Incremental/Delta
  4. **Service Quality** — availability/SLA, replication factor, trust level, rate limits
  5. **Verification** — content-addressing, digital signatures, integrity verification methods
- R10. YieldDescription is expected to grow in complexity. Design for extensibility.

**Usage (U) — ODRL Bridge**

- R11. Usage stays with ODRL — QUAY does not reinvent policy expression. `odrl:hasPolicy` connects DCAT resources to ODRL policies.
- R12. QUAY defines domain-specific ODRL Actions (e.g., quay:Retrieve, quay:Store, quay:Replicate, quay:Archive) and Constraints relevant to data access.

**Simple Properties (not classes)**

- R13. Encryption and checksum are annotation/datatype properties on Distribution or DataService — not reified classes:
  - `quay:encryptionAtRest` → literal ("AES-256", "GPG", "none")
  - `quay:encryptionInTransit` → literal ("TLS 1.3", "SSH", "none")
  - `quay:checksum` → literal (hash value)
  - `quay:checksumAlgorithm` → literal ("SHA-256", "MD5")

**Validation**

- R14. The model must be validated by mapping ALL major git-annex remote types (S3, rsync, WebDAV, directory, rclone, BitTorrent, IPFS, hook, web, borg, git-lfs). Each mapping must work naturally without forcing constructs.
- R15. The model must also express non-git-annex scenarios: REST API access, database connections, streaming services, SPARQL endpoints.

## Success Criteria

- Every git-annex remote type maps naturally to QUAY classes/properties without artificial constructs
- A non-expert can read a QUAY description and understand how to access the data
- QUAY descriptions are machine-actionable — a tool could parse them to configure actual access
- The ontology passes OWL reasoning without errors (respecting the DL validation skip for imported DCAT/dcterms constructs)

## Scope Boundaries

- **In scope:** TBox design (classes, properties, hierarchy). ABox examples for validation.
- **Out of scope for this draft:** SHACL shapes, full ODRL policy examples, provenance tracking, API documentation.
- **Not git-annex-specific:** git-annex is validation material. QUAY must work for any data access scenario.

## Key Decisions

- **One qualification node per pillar, not three layers:** AccessDescription and YieldDescription are independent nodes that qualify DCAT resources. Usage uses ODRL directly.
- **Encryption/checksum as simple properties:** These don't warrant their own class hierarchy. Two annotation properties each.
- **Start maximal, prune after mapping:** All five Yield dimensions included initially. Remove what git-annex mapping doesn't justify.
- **OWL classes, not controlled vocabularies:** Protocol, AuthScheme, Operation are proper OWL classes with subclass hierarchies, because QUAY IS the ontology.

## Validation: Git-Annex Remote Type Mapping

All 12 major remote types mapped successfully against the model. Key findings:

| Remote Type | Protocol | AuthScheme | Operations | Delivery | Coverage | Service Quality | Verification |
|---|---|---|---|---|---|---|---|
| S3 | S3 | AWSCredential | R/W/D/L | Bulk | Complete | High avail | SHA256 |
| rsync | Rsync | SSHKey | R/W/D | Bulk | Complete | Trust-dep | SHA256 |
| WebDAV | WebDAV | BasicAuth | R/W/D | Bulk | Complete | Server-dep | SHA256 |
| directory | LocalFS | NoAuth | R/W/D/L | Bulk | Complete | Disk-dep | SHA256 |
| rclone | Rclone | Varies | R/W/D | Bulk | Complete | Backend-dep | SHA256 |
| web | HTTP | NoAuth | R only | Bulk/Stream | Varies | URL-dep | Optional |
| BitTorrent | BitTorrent | NoAuth | R only | P2P | Complete | Swarm-dep | Piece hash |
| IPFS | IPFS | NoAuth | R/W | Bulk | Complete | DHT | Content-addr |
| git-lfs | HTTP | OAuth2 | R/W/D | Bulk | Complete | Server-dep | SHA256 |
| borg | SSH | SSHKey | R/W/D | Bulk | Complete | Single host | SHA256 |
| hook | Custom | Custom | Configurable | Config | Config | Config | Custom |
| glacier | S3 | AWSCredential | R/W/D | Bulk | Complete | Very high | SHA256 |

**All five Yield dimensions survived.** No pruning needed.

**Simplicity decisions:**
- rclone/hook modeled as Protocol=Rclone/Custom — no meta-protocol complexity
- Glacier retrieval latency modeled as a simple property, not a special delivery mode
- Don't over-model edge cases in v1

## Outstanding Questions

### Deferred to Planning
- [Affects R4][Design] AccessDescription attachment point — on Distribution directly or as n-ary between Distribution and DataService
- [Affects R6][Needs research] Protocol/AuthScheme/Operation — OWL classes vs named individuals
- [Affects R12][Needs research] QUAY-specific ODRL Actions beyond standard read/use/distribute
- [Affects R10][Technical] Update frequency — reuse dcterms:accrualPeriodicity or QUAY-specific

## Next Steps

-> Build TBox in ontosphere
-> Validate with ABox examples (S3, rsync, WebDAV use cases)
-> Run reasoning to check consistency
