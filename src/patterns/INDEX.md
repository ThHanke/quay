# QUAY Pattern Examples — Feature Index

Each pattern demonstrates a different combination of QUAY vocabulary features.
All patterns validate against the QUAY SHACL shapes (`src/shacl/quay-shapes.ttl`).

## Feature Matrix

| Pattern | Encryption | SQ Metrics | Rate/Cost | Retention | Jurisdiction | ODRL Policy | Schema Link |
|---------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **Generic Examples** | | | | | | | |
| [REST API](generic-examples/rest-api/) | transit | | rate, cost | | | rate-limit + prohibition | conformsTo |
| [Azure Blob](generic-examples/azure-blob/) | both | uptime, repl | | 7y | DEU | geo-constrained write | |
| [PostgreSQL](generic-examples/postgresql/) | both | uptime, RTO, RPO, repl | | 10y | | delete prohibition | |
| [Kafka](generic-examples/kafka/) | transit | uptime, repl | rate 10k | 7d | | rate-limit constraint | |
| [Zenodo](generic-examples/zenodo/) | transit | | | | | delete prohibition | |
| [CKAN](generic-examples/ckan/) | transit | | | | | write prohibition | conformsTo |
| [OAI-PMH](generic-examples/oai-pmh/) | transit | | | | | read + list | conformsTo |
| [SPARQL Endpoint](generic-examples/sparql-endpoint/) | transit | | | | | read-only | conformsTo |
| [FTP Archive](generic-examples/ftp-archive/) | none | | | | | | |
| **git-annex Remotes** | | | | | | | |
| [S3](git-annex-remotes/s3/) | both | uptime, repl | | 5y | | full CRUD | |
| [Glacier](git-annex-remotes/glacier/) | both | uptime, RTO, RPO, repl | | 99y | USA | geo-constraint + delete prohibition | |
| All other git-annex | transit | | | | | | |

## ODRL Policy Patterns

| Pattern | Permission | Prohibition | Constraint Type |
|---------|-----------|-------------|-----------------|
| REST API | Read (rate-limited) | Write | `odrl:count` < 1000 |
| Azure Blob | Read, Write (geo-constrained) | | `odrl:spatial` = DEU |
| PostgreSQL | Read | Delete | |
| Kafka | Read (rate-limited), Write | | `odrl:count` <= 10000 |
| Zenodo | Read | Delete | |
| CKAN | Read | Write | |
| OAI-PMH | Read, List | | |
| SPARQL Endpoint | Read | | |
| S3 | Read, Write, Delete, List | | |
| Glacier | Read (geo-constrained), Write | Delete | `odrl:spatial` = USA |

## Progressive Adoption

The patterns show that QUAY properties are optional and progressively adoptable:

1. **Minimal** (FTP Archive) — just protocol, auth, operations, delivery mode
2. **Standard** (most git-annex) — adds encryption, yield descriptors
3. **Extended** (S3, Glacier) — adds SQ metrics, retention, ODRL policies
4. **Full** (Azure Blob, PostgreSQL) — all dimensions including jurisdiction, compliance retention, geo-constrained policies
