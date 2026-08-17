## Customize Makefile settings for quay
##
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile

# Skip OWL 2 DL profile validation — DCAT and dcterms contain OWL Full
# constructs (property punning, rdfs:Resource ranges) that are not DL-compliant.
$(REPORTDIR)/validate_profile_owl2dl_%.txt: % | $(REPORTDIR) $(TMPDIR)
	echo "Skipping OWL 2 DL profile validation (DCAT/dcterms incompatible)" > $@
