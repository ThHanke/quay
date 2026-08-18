---
title: "feat: ODRL integration for data access policies"
type: feat
status: active
date: 2026-08-18
origin: docs/brainstorms/quay-ontology-design-requirements.md
---

# feat: ODRL integration for data access policies

## Overview

QUAY already imports ODRL 2.2 but never references it — the SLME import pulls 281 declarations including schema.org, FOAF, and vcard. This plan narrows the import to only the ODRL terms QUAY needs and integrates ODRL policies with QUAY's existing access control vocabulary (Operations, AccessDescription).

## Problem Frame

QUAY models access operations (Read, Write, Delete, List, Replicate) and constraints (rateLimit, quotaLimit, costDescription, storageJurisdiction) but has no way to express **policies** — who is permitted/prohibited which operations, under what conditions. ODRL 2.2 is the W3C standard for exactly this: machine-readable permission, prohibition, and duty rules with constraints.

Without ODRL integration, QUAY consumers cannot:
- Express "anonymous users may read but not write"
- Attach geographic or temporal constraints to permissions
- Define obligations (duties) like attribution or logging
- Make access decisions machine-actionable beyond simple operation listing

(see origin: `docs/brainstorms/quay-ontology-design-requirements.md` — R11, R12)

## Requirements Trace

- R1. Link ODRL policies to DCAT distributions via `odrl:hasPolicy`
- R2. Map QUAY Operations to ODRL Actions (reuse `odrl:use` where possible, mint QUAY-specific actions for read/write/delete/list/replicate)
- R3. Express access constraints as ODRL Constraints (rate limits, geographic, temporal)
- R4. Support ODRL permission, prohibition, and duty rules
- R5. Narrow SLME import to only referenced ODRL terms (eliminate schema.org/FOAF/vcard bloat)
- R6. Add SHACL shapes for ODRL policy validation
- R7. Add pattern examples demonstrating ODRL policies on existing QUAY distributions
- R8. Maintain backward compatibility — existing patterns without policies remain valid

## Scope Boundaries

- ODRL profiles (Agreement, Offer, Ticket) — only `odrl:Set` used initially; Agreements need party modeling (future work)
- Party modeling (assignee/assigner) — deferred; policies attach to distributions, not user roles
- Conflict resolution strategies — deferred; QUAY adopts ODRL default (prohibitions override permissions)
- Compensation/payment duties — deferred; QUAY pricing is descriptive (`costDescription`), not transactional
- ODRL Logical Constraints (and/or/xone) — deferred; simple constraints sufficient for initial integration

### Deferred to Separate Tasks

- WS4: SHACL validation pipeline, CI integration, adoption patterns
- Party/role modeling for multi-stakeholder access control
- ODRL Agreement workflows (offer → agreement lifecycle)

## Design Decisions

### D1: QUAY Operations as ODRL Action subclasses

QUAY already has `Operation` with subclasses `ReadOperation`, `WriteOperation`, etc. These map naturally to ODRL's `odrl:Action` class.

**Decision:** Declare each QUAY Operation subclass as also `rdfs:subClassOf odrl:Action`. This lets ODRL rules reference QUAY operations directly as actions without a separate mapping vocabulary.

**Rationale:** ODRL's built-in actions (`odrl:use`, `odrl:distribute`) are too coarse for data access. QUAY's operation granularity (read vs write vs list vs replicate) is the right level for access policies. Making them ODRL Action subclasses means they work natively in ODRL rules.

### D2: Policy attachment point

**Decision:** Attach policies at `dcat:Distribution` level via `odrl:hasPolicy`. Not at Dataset or DataService level.

**Rationale:** QUAY's core qualification pattern is per-distribution. A dataset may have multiple distributions with different access policies (e.g., public read endpoint vs. authenticated write endpoint). Distribution-level policies align with existing AccessDescription/YieldDescription attachment.

### D3: Constraint mapping for WS3 properties

WS3 added `rateLimit`, `quotaLimit`, `storageJurisdiction`. These can appear as ODRL constraints:

| WS3 Property | ODRL LeftOperand | Usage |
|---|---|---|
| rateLimit | `odrl:count` | `odrl:lt` constraint on requests |
| storageJurisdiction | `odrl:spatial` | `odrl:eq` constraint on location |
| retentionPeriod | `odrl:dateTime` | `odrl:lt` constraint on duration |

**Decision:** Keep WS3 properties as direct data properties on AccessDescription/Distribution AND support equivalent ODRL Constraint expressions. They serve different purposes: WS3 properties are descriptive metadata, ODRL constraints are policy rules.

### D4: SLME seed strategy

**Decision:** Add external declarations for exactly the ODRL terms QUAY references in `quay-edit.owl`. SLME uses these as seeds to extract only the relevant subgraph from ODRL22.ttl.

**Already done:** 25 seed declarations added (8 classes, 10 object properties, 7 named individuals). On next `make imports`, the ODRL import should shrink from 281 declarations to ~40-60.

## Implementation Units

### IU1: Operation → Action bridging axioms

**Files:**
- `src/ontology/quay-edit.owl`

**Work:**
- Add `SubClassOf(:Operation odrl:Action)` — makes all QUAY operations valid ODRL actions
- Alternatively, add individual `SubClassOf(:ReadOperation odrl:Action)` etc. if we want Operation to remain independent of ODRL
- Add `rdfs:comment` annotations explaining the ODRL bridge

**Decision needed at implementation:** Single bridge at Operation level vs individual bridges per subclass. Recommend single bridge — simpler, and if something is a QUAY Operation it should be usable as an ODRL Action.

### IU2: Example ODRL policies in pattern files

**Files:**
- `src/patterns/generic-examples/rest-api/shape-data.ttl` — add rate-limit policy
- `src/patterns/git-annex-remotes/glacier/shape-data.ttl` — add geo-restriction + retention policy
- `src/patterns/git-annex-remotes/s3/shape-data.ttl` — add read/write permission policy

**Work per pattern:**
- Add `@prefix odrl: <http://www.w3.org/ns/odrl/2/> .`
- Create `odrl:Set` policy instance
- Add `odrl:permission` / `odrl:prohibition` rules using QUAY operations as actions
- Add `odrl:constraint` where applicable (rate limits, geographic)
- Link policy to distribution via `odrl:hasPolicy`

**Example structure (REST API):**
```turtle
ex:rest-api-policy a odrl:Set ;
    odrl:permission [
        a odrl:Permission ;
        odrl:action [ a quay:ReadOperation ] ;
        odrl:target ex:rest-api-distribution ;
        odrl:constraint [
            a odrl:Constraint ;
            odrl:leftOperand odrl:count ;
            odrl:operator odrl:lt ;
            odrl:rightOperand "1000"^^xsd:integer
        ]
    ] .

ex:rest-api-distribution odrl:hasPolicy ex:rest-api-policy .
```

### IU3: SHACL shapes for ODRL policies

**Files:**
- `src/shacl/quay-shapes.ttl`

**Work:**
- Add `PolicyShape` targeting `odrl:Set` — require at least one permission or prohibition
- Add `PermissionShape` targeting `odrl:Permission` — require `odrl:action` and `odrl:target`
- Add `ConstraintShape` targeting `odrl:Constraint` — require `odrl:leftOperand`, `odrl:operator`, `odrl:rightOperand`
- Keep shapes as SHOULD-level (not MUST) to allow minimal valid policies

### IU4: Rebuild SLME import

**Files:**
- `src/ontology/imports/odrl_import.owl` (regenerated by ODK)

**Work:**
- Run `make imports` (or `make refresh-odrl`) to trigger SLME re-extraction
- Verify import shrinks from 281 to ~40-60 declarations
- Verify no schema.org, FOAF, or vcard terms remain
- Verify all 25 seed terms are present in the narrowed import

### IU5: SPARQL validation

**Files:**
- `src/sparql/` (if validation queries exist)

**Work:**
- Verify existing IRI-label checks pass with ODRL external declarations
- Add validation query: every `odrl:Set` linked via `odrl:hasPolicy` must have ≥1 `odrl:permission` or `odrl:prohibition`

## Sequencing

1. **IU4** — Rebuild SLME import first to verify seed declarations work
2. **IU1** — Add Operation→Action bridge axioms
3. **IU2** — Add example policies to patterns (tests the bridge)
4. **IU3** — Add SHACL shapes
5. **IU5** — Validation queries

IU4 gates everything — if SLME doesn't narrow properly, seeds need adjustment before proceeding.

## Risks

| Risk | Impact | Mitigation |
|---|---|---|
| SLME extracts too much (CC, SKOS) | Bloated import persists | Tighten `base_iris` or add exclusion filter |
| SLME extracts too little | Missing ODRL axioms break reasoning | Check import for completeness of class hierarchy and property domains/ranges |
| Operation ⊑ Action creates unintended inferences | ODRL reasoner treats all operations as actions | Test with HermiT/ELK; Operation subclass is intentional |
| ODRL policies add complexity without adoption | Effort wasted | Keep policies optional; existing patterns work without them |

## Test Scenarios

- [ ] `make imports` regenerates `odrl_import.owl` with <80 declarations
- [ ] No schema.org, FOAF, vcard terms in regenerated import
- [ ] `robot verify` passes all SPARQL checks after bridge axioms added
- [ ] SHACL validation passes on pattern files with ODRL policies
- [ ] SHACL validation catches malformed policies (missing action, missing target)
- [ ] Pattern files with no ODRL policy still validate (backward compat)
- [ ] HermiT consistency check passes with Operation ⊑ Action axiom
