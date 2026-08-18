## Customize Makefile settings for quay
##
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile

# Skip OWL 2 DL profile validation — DCAT and dcterms contain OWL Full
# constructs (property punning, rdfs:Resource ranges) that are not DL-compliant.
$(REPORTDIR)/validate_profile_owl2dl_%.txt: % | $(REPORTDIR) $(TMPDIR)
	echo "Skipping OWL 2 DL profile validation (DCAT/dcterms incompatible)" > $@

# QUAY naming convention checks:
# 1. Every QUAY term must have rdfs:label (English or untagged)
# 2. IRI local name must match rdfs:label (PascalCase for classes, camelCase for properties)
SPARQL_VALIDATION_CHECKS += quay-label-required quay-iri-label-match

SHACL_SHAPES = ../shacl/quay-shapes.ttl
PATTERN_DATA = $(shell find ../patterns -name 'shape-data.ttl' 2>/dev/null)

.PHONY: validate-patterns
validate-patterns: $(SHACL_SHAPES) $(PATTERN_DATA)
	@FAIL=0; \
	for f in $(PATTERN_DATA); do \
		relpath=$$(echo $$f | sed 's|^\.\./||'); \
		result=$$(shacl validate --shapes /work/src/shacl/quay-shapes.ttl --data /work/src/$$relpath --text 2>&1); \
		if echo "$$result" | grep -q "Conforms"; then \
			echo "PASS $$relpath"; \
		else \
			echo "FAIL $$relpath"; \
			echo "$$result" | head -5; \
			FAIL=1; \
		fi; \
	done; \
	if [ $$FAIL -eq 1 ]; then echo "SHACL validation failed."; exit 1; fi; \
	echo "All patterns conform."

test: validate-patterns
