---
title: "feat: Close property gaps with vocabulary reuse"
type: feat
status: active
date: 2026-08-18
origin: docs/brainstorms/quay-ontology-design-requirements.md
---

# feat: Close property gaps with vocabulary reuse

## Overview

QUAY has 6 property gaps identified in review: encryption is free-text, service quality lacks measurable properties, no rate limits/quotas/pricing, no schema link beyond mediaType, no geographic/residency constraints, no freshness/retention. This plan fills each gap by reusing existing W3C/community vocabularies wherever possible and minting new QUAY terms only when nothing suitable exists.

## Problem Frame

QUAY models HOW data is accessed (AccessDescription) and WHAT you get (YieldDescription) but several critical metadata dimensions are either missing or underspecified. A consumer reading a QUAY description cannot determine: what encryption protects the data, what SLA the service offers, what rate limits apply, what schema the data conforms to, where data is physically stored, or how fresh it is. These gaps reduce QUAY's value for machine-actionable data access decisions.

(see origin: `docs/brainstorms/quay-ontology-design-requirements.md` — R9, R10, R13)

## Requirements Trace

- R1. Replace `encryptionAtRest` and `encryptionInTransit` free-text strings with controlled vocabulary
- R2. Add measurable data properties to ServiceQuality (SLA%, uptime, RTO, RPO, replication factor)
- R3. Add rate limit, quota, and cost/pricing metadata to AccessDescription
- R4. Enable linking to schema/format definitions beyond dcat:mediaType
- R5. Support geographic storage constraints and data residency
- R6. Support update freshness interval and retention policy
- R7. Reuse existing well-known vocabularies wherever possible — minimize new QUAY terms
- R8. Update SHACL shapes, pattern examples, and build validation for all changes

## Scope Boundaries

- Encryption vocabulary covers algorithms only (AES-256, TLS 1.3, etc.) — not key management or certificate chains
- Service quality metrics are simple data properties — not the full W3C DQV measurement framework
- Pricing is descriptive metadata, not transactional — no payment flow modeling
- Geographic constraints are storage location pointers — not full GeoSPARQL geometry modeling
- ODRL policy refinements (WS2) are a separate workstream

### Deferred to Separate Tasks

- Full ODRL integration for rate limits as policy constraints: WS2
- DPV integration for GDPR compliance modeling: future iteration
- DQV integration for formal quality measurement pipelines: future iteration

## Context & Research

### Relevant Code and Patterns

- `src/ontology/quay-edit.owl` — OWL Functional Syntax source. Current encryption properties at lines 119-120, 384-390
- `src/shacl/quay-shapes.ttl` — SHACL shapes mirror OWL restrictions
- `src/patterns/git-annex-remotes/s3/shape-data.ttl` — S3 pattern uses `quay:encryptionAtRest "AES-256"` (line 22)
- `src/patterns/generic-examples/rest-api/shape-data.ttl` — REST API pattern uses `quay:encryptionInTransit "TLS 1.2"` (line 27)
- SPDX checksum pattern in quay-edit.owl (lines 122-127) — model to follow for encryption vocabulary

### External References — Vocabulary Survey

| Gap | Reusable Vocabulary | What It Covers | What QUAY Must Mint |
|-----|-------------------|----------------|-------------------|
| **Encryption** | None found suitable | WoT Security (`wotsec:`) covers auth schemes not encryption algorithms. No W3C vocab for cipher suites. | `EncryptionAlgorithm` class + named individuals. Follow SPDX Checksum pattern. |
| **SQ Metrics** | W3C DQV (`dqv:`) available but heavyweight | DQV defines Metric/Dimension/Measurement framework for data quality. | Simple data properties: `uptimePercentage`, `recoveryTimeObjective`, `recoveryPointObjective`, `replicationFactor`. Reference DQV compatibility in docs. |
| **Rate/Quota/Pricing** | schema.org `PriceSpecification` (e-commerce focus). ODRL constraints (already imported). | ODRL can model limits as policy constraints but that's WS2. schema.org Offer is too e-commerce. | `rateLimit`, `quotaLimit`, `costDescription` as data properties on AccessDescription. |
| **Schema Link** | **dcterms:conformsTo** (already available via DCAT import) | Points Distribution to schema URI. W3C Recommendation. Widely used in DCAT-AP. | **None** — document usage pattern only. |
| **Geo/Residency** | **dcterms:spatial** (already via DCAT). W3C DPV has `dpv:hasStorageCondition`, `dpv:StorageLocation`. | dcterms:spatial covers geographic extent. DPV covers jurisdiction. | `storageJurisdiction` object property pointing to jurisdiction URI. Lightweight — no DPV import. |
| **Freshness/Retention** | **dcterms:accrualPeriodicity** (already via DCAT). **dcat:temporalResolution**. | Update frequency and minimum temporal granularity already covered. | `retentionPeriod` (xsd:duration) only. |

Survey sources:
- [W3C DQV](https://www.w3.org/TR/vocab-dqv/)
- [W3C WoT Security Ontology](https://w3c.github.io/wot-thing-description/ontology/wotsec.html)
- [W3C DPV](https://w3id.org/dpv/)
- [ODRL Vocabulary 2.2](https://www.w3.org/TR/odrl-vocab/)
- [DCAT 3](https://www.w3.org/TR/vocab-dcat-3/)
- [schema.org PriceSpecification](https://schema.org/PriceSpecification)
- [GeoSPARQL](https://docs.ogc.org/is/22-047r1/22-047r1.html)
- [DCAT-AP 3.0](https://semiceu.github.io/DCAT-AP/r5r/releases/3.0.0/)

## Key Technical Decisions

- **Encryption: class hierarchy with named individuals, not SKOS concepts** — Follows the SPDX Checksum pattern already in QUAY. OWL classes enable reasoning (e.g., "is this AES-based?"). Encryption properties change from DatatypeProperty to ObjectProperty.
- **Service quality metrics: simple data properties on YieldDescription, not DQV** — DQV requires reifying every measurement as a dqv:QualityMeasurement instance. Too heavy for QUAY's use case of static descriptive metadata. Simple xsd:decimal/xsd:duration properties match QUAY's existing pattern.
- **Schema link: document existing dcterms:conformsTo, don't mint new terms** — DCAT 3 already provides this. Adding a QUAY-specific property would create semantic duplication.
- **Storage jurisdiction: lightweight property pointing to URI, not full DPV import** — DPV is a large vocabulary (200+ concepts). QUAY only needs a pointer to jurisdiction. A simple object property with rdfs:range rdfs:Resource allows linking to DPV, Wikidata, or EU controlled vocabulary URIs without the import.
- **Retention period: single xsd:duration property** — Simple and unambiguous. Complements dcterms:accrualPeriodicity (update frequency) already available via DCAT.
- **Rate limit / quota: data properties on AccessDescription** — These describe access constraints, not yield characteristics. Domain is AccessDescription, not YieldDescription.

## Open Questions

### Resolved During Planning

- **Should we import DQV?** — No. Too heavyweight. Simple data properties suffice. Document DQV compatibility for interoperability.
- **Should we import DPV for jurisdictions?** — No. A simple object property pointing to external URIs is sufficient. Users can point to DPV, Wikidata, or EU vocabulary URIs.
- **Where do rate limits attach?** — AccessDescription. They constrain how the access point behaves, not what the data looks like.
- **Do we need a separate EncryptionScheme for at-rest vs in-transit?** — No. Same EncryptionAlgorithm class. Two properties with different domains distinguish usage context.

### Deferred to Implementation

- Exact set of initial EncryptionAlgorithm individuals (AES256, AES128, GPG, TLS13, TLS12, SSH, NoEncryption — final list during implementation)
- Whether `costDescription` should be xsd:string (free text like "free", "$0.023/GB") or a structured type — start with xsd:string, revisit if patterns emerge

## Implementation Units

- [ ] **Unit 1: Encryption Controlled Vocabulary**

**Goal:** Replace free-text encryption properties with object properties pointing to an EncryptionAlgorithm class hierarchy.

**Requirements:** R1, R7

**Dependencies:** None

**Files:**
- Modify: `src/ontology/quay-edit.owl`
- Modify: `src/shacl/quay-shapes.ttl`

**Approach:**
- Declare `EncryptionAlgorithm` class
- Declare subclasses: `Aes256Encryption`, `Aes128Encryption`, `GpgEncryption`, `Tls13Encryption`, `Tls12Encryption`, `SshEncryption`, `NoEncryption`
- Change `encryptionAtRest` and `encryptionInTransit` from DataProperty→xsd:string to ObjectProperty→EncryptionAlgorithm
- Add rdfs:label, rdfs:comment, obo:IAO_0000115 definitions for all new terms
- Add DisjointClasses axiom for EncryptionAlgorithm subclasses
- Add EncryptionAlgorithm to top-level DisjointClasses axiom
- Follow SPDX Checksum pattern: blank node instances `[ a quay:Aes256Encryption ]`

**Patterns to follow:**
- SPDX Checksum declarations in `src/ontology/quay-edit.owl` lines 122-127
- Protocol/AuthenticationScheme hierarchy pattern throughout quay-edit.owl

**Test scenarios:**
- Happy path: S3 pattern validates with `quay:encryptionAtRest [ a quay:Aes256Encryption ]` replacing `"AES-256"`
- Happy path: SPARQL label-required check passes for all new EncryptionAlgorithm terms
- Happy path: SPARQL IRI-label-match check passes for all new terms
- Edge case: Distribution with NoEncryption for both at-rest and in-transit validates
- Error path: Distribution with encryption pointing to a non-EncryptionAlgorithm class fails SHACL

**Verification:**
- ODK build passes (`make test` in Docker)
- All existing patterns still validate against SHACL shapes

- [ ] **Unit 2: Service Quality Data Properties**

**Goal:** Add measurable data properties to YieldDescription for SLA, recovery, and replication metrics.

**Requirements:** R2, R7

**Dependencies:** None (can run parallel with Unit 1)

**Files:**
- Modify: `src/ontology/quay-edit.owl`
- Modify: `src/shacl/quay-shapes.ttl`

**Approach:**
- Add 4 datatype properties on YieldDescription:
  - `uptimePercentage` → xsd:decimal (e.g., 99.95)
  - `recoveryTimeObjective` → xsd:duration (e.g., PT4H)
  - `recoveryPointObjective` → xsd:duration (e.g., PT1H)
  - `replicationFactor` → xsd:nonNegativeInteger (e.g., 3)
- Add rdfs:label, obo:IAO_0000115 definitions
- SHACL: optional properties (no minCount), with datatype constraints
- These complement the existing ServiceQuality class hierarchy (HighAvailability etc.) — the class says WHAT kind of quality, these properties say HOW MUCH

**Patterns to follow:**
- Existing `encryptionAtRest`/`encryptionInTransit` data property pattern in quay-edit.owl

**Test scenarios:**
- Happy path: S3 yield with `quay:uptimePercentage "99.95"^^xsd:decimal` validates
- Happy path: YieldDescription with no SQ properties still validates (all optional)
- Edge case: replicationFactor of 0 is valid (local filesystem, no replication)
- Error path: uptimePercentage with string value fails SHACL datatype check

**Verification:**
- Build passes, all existing patterns validate
- New properties appear in quay-full.owl with correct domain/range

- [ ] **Unit 3: Rate Limit, Quota, and Cost Properties**

**Goal:** Add access constraint properties for rate limiting, quotas, and cost metadata.

**Requirements:** R3

**Dependencies:** None

**Files:**
- Modify: `src/ontology/quay-edit.owl`
- Modify: `src/shacl/quay-shapes.ttl`

**Approach:**
- Add 3 datatype properties on AccessDescription:
  - `rateLimit` → xsd:nonNegativeInteger (requests per time window)
  - `quotaLimit` → xsd:string (e.g., "100GB/month", "10000 requests/day" — structured as free text because units vary widely)
  - `costDescription` → xsd:string (e.g., "free", "$0.023/GB", "subscription required")
- Domain: AccessDescription (these constrain access, not yield)
- SHACL: optional, with appropriate datatype constraints
- Note: ODRL can express these as formal policy constraints (WS2). These properties serve as simple descriptive metadata for consumers who don't need full ODRL reasoning.

**Patterns to follow:**
- Existing data property declarations in quay-edit.owl

**Test scenarios:**
- Happy path: S3 access with `quay:rateLimit "5000"^^xsd:nonNegativeInteger` validates
- Happy path: AccessDescription without any cost/rate properties validates (all optional)
- Happy path: Free public dataset with `quay:costDescription "free"` validates

**Verification:**
- Build passes, existing patterns validate

- [ ] **Unit 4: Document Schema/Format Link (dcterms:conformsTo)**

**Goal:** Document that schema/format description uses existing DCAT property — no new QUAY terms needed.

**Requirements:** R4, R7

**Dependencies:** None

**Files:**
- Modify: `src/patterns/generic-examples/rest-api/shape-data.ttl` (add conformsTo example)
- Modify: `src/patterns/generic-examples/sparql-endpoint/shape-data.ttl` (add conformsTo example)

**Approach:**
- Add `dcterms:conformsTo <schema-URI>` to 2 pattern examples where schema linkage is natural
- REST API: link to JSON Schema or OpenAPI spec URI
- SPARQL endpoint: link to SHACL shapes or VoID description URI
- No ontology changes needed — dcterms:conformsTo is already available via DCAT import

**Patterns to follow:**
- Existing pattern file structure in `src/patterns/`

**Test scenarios:**
- Happy path: Pattern with `dcterms:conformsTo` validates against SHACL
- Happy path: Pattern without `dcterms:conformsTo` still validates (optional in DCAT)

**Verification:**
- `make test` passes including SHACL validation of updated patterns

- [ ] **Unit 5: Storage Jurisdiction Property**

**Goal:** Add a property for expressing where data is physically stored / jurisdictional constraints.

**Requirements:** R5

**Dependencies:** None

**Files:**
- Modify: `src/ontology/quay-edit.owl`
- Modify: `src/shacl/quay-shapes.ttl`

**Approach:**
- Add object property `storageJurisdiction` with domain dcat:Distribution, range rdfs:Resource
- Range is rdfs:Resource (not a QUAY class) so users can point to:
  - EU controlled vocabulary URIs (e.g., `http://publications.europa.eu/resource/authority/country/DEU`)
  - Wikidata entities (e.g., `wd:Q183` for Germany)
  - DPV jurisdiction concepts (e.g., `dpv:DE`)
  - Any URI identifying a jurisdiction
- Add rdfs:label "storage jurisdiction", definition, rdfs:comment
- SHACL: optional property, no class constraint on range (external URIs)
- Note: `dcterms:spatial` (already in DCAT) covers geographic extent of the dataset content. `storageJurisdiction` covers where data is physically stored — different concern.

**Patterns to follow:**
- Existing object property pattern in quay-edit.owl

**Test scenarios:**
- Happy path: S3 distribution with `quay:storageJurisdiction <http://publications.europa.eu/resource/authority/country/DEU>` validates
- Happy path: Distribution without storageJurisdiction validates (optional)
- Edge case: Multi-region storage with multiple storageJurisdiction values validates

**Verification:**
- Build passes, SPARQL naming checks pass

- [ ] **Unit 6: Freshness and Retention Properties**

**Goal:** Add retention period property, document existing DCAT freshness properties.

**Requirements:** R6, R7

**Dependencies:** None

**Files:**
- Modify: `src/ontology/quay-edit.owl`
- Modify: `src/shacl/quay-shapes.ttl`

**Approach:**
- Add datatype property `retentionPeriod` → xsd:duration, domain dcat:Distribution
  - How long data is guaranteed to be retained (e.g., "P5Y" = 5 years, "P90D" = 90 days)
- Document that `dcterms:accrualPeriodicity` (already via DCAT) covers update frequency
- Document that `dcat:temporalResolution` covers minimum time granularity
- Only `retentionPeriod` is new — the other two are already available

**Patterns to follow:**
- Data property pattern in quay-edit.owl

**Test scenarios:**
- Happy path: Distribution with `quay:retentionPeriod "P5Y"^^xsd:duration` validates
- Happy path: Distribution without retentionPeriod validates (optional)
- Edge case: Glacier archive with `quay:retentionPeriod "P99Y"^^xsd:duration` validates

**Verification:**
- Build passes

- [ ] **Unit 7: Update Pattern Examples**

**Goal:** Update S3 and REST API patterns to demonstrate new properties. Add one new pattern demonstrating all properties together.

**Requirements:** R8

**Dependencies:** Units 1-6

**Files:**
- Modify: `src/patterns/git-annex-remotes/s3/shape-data.ttl`
- Modify: `src/patterns/generic-examples/rest-api/shape-data.ttl`
- Modify: `src/patterns/git-annex-remotes/glacier/shape-data.ttl`

**Approach:**
- S3 pattern: replace `quay:encryptionAtRest "AES-256"` with `quay:encryptionAtRest [ a quay:Aes256Encryption ]`, add `quay:encryptionInTransit [ a quay:Tls12Encryption ]`, add `quay:uptimePercentage`, `quay:replicationFactor 3`
- REST API pattern: replace `quay:encryptionInTransit "TLS 1.2"` with object property form, add `quay:rateLimit`, `quay:costDescription "free"`
- Glacier pattern: add `quay:retentionPeriod`, `quay:storageJurisdiction`
- Verify all updated patterns pass SHACL validation

**Patterns to follow:**
- Existing shape-data.ttl files

**Test scenarios:**
- Happy path: All 3 updated patterns pass SHACL validation
- Happy path: Full ODK build succeeds with all changes

**Verification:**
- `make test` passes including `validate-patterns` target
- All SPARQL naming checks pass

## System-Wide Impact

- **Interaction graph:** Encryption property type change (DataProperty→ObjectProperty) is a breaking change for any existing QUAY consumers. All pattern files using `encryptionAtRest`/`encryptionInTransit` as string literals must be updated.
- **Error propagation:** SHACL shapes must be updated in lockstep with OWL changes — mismatched shapes will reject valid data or accept invalid data.
- **API surface parity:** SPARQL validation checks (label-required, IRI-label-match) automatically cover new terms — no manual wiring needed.
- **Unchanged invariants:** AccessDescription and YieldDescription cardinality constraints are unchanged. All new properties are optional. Existing valid QUAY data remains valid (except encryption string→object migration).

## Risks & Dependencies

| Risk | Mitigation |
|------|------------|
| Encryption type change breaks existing consumers | This is pre-1.0. Document as breaking change in release notes. Pattern examples serve as migration guide. |
| Too many new properties overwhelm consumers | All new properties are optional. Core QUAY (access + yield qualification) unchanged. |
| `quotaLimit` and `costDescription` as xsd:string lack structure | Pragmatic choice for v1. Can be refined to structured types in future if patterns emerge. Document expected formats in rdfs:comment. |
| `storageJurisdiction` range too broad (rdfs:Resource) | Intentional — allows linking to any jurisdiction vocabulary. SHACL can constrain to specific URI patterns per deployment. |

## Sources & References

- **Origin document:** [quay-ontology-design-requirements.md](docs/brainstorms/quay-ontology-design-requirements.md)
- Related code: `src/ontology/quay-edit.owl`, `src/shacl/quay-shapes.ttl`
- W3C DQV: https://www.w3.org/TR/vocab-dqv/
- W3C DPV: https://w3id.org/dpv/
- W3C WoT Security: https://w3c.github.io/wot-thing-description/ontology/wotsec.html
- DCAT 3: https://www.w3.org/TR/vocab-dcat-3/
- ODRL 2.2: https://www.w3.org/TR/odrl-vocab/
- schema.org PriceSpecification: https://schema.org/PriceSpecification
- DCAT-AP 3.0: https://semiceu.github.io/DCAT-AP/r5r/releases/3.0.0/
