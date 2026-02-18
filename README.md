# URF Manuscript README — Template v1.0

This README serves as a **cover page + review contract** for a manuscript published under the Unified Rigidity Framework (URF).

It defines identity, scope, verification, and how feedback must be given.

---

## Manuscript Identity

**Title:** <FULL TITLE>  
**Manuscript ID:** <URF-P-XXXX>  
**Author:** Inacio F. Vasquez  
**Status:** <DRAFT | FROZEN | OPEN_REVIEW | ACCEPTED | ARCHIVED>  
**Version Tag:** <GIT TAG>  
**DOI:** <DOI IF ASSIGNED>

---

## Canonical Artifacts

This repository is the **canonical source** for this manuscript.

Contents:
- `manuscript.tex` — LaTeX source
- `manuscript.pdf` — compiled PDF
- `STATUS.md` — state + history
- `CITATION.cff` — citation metadata

---

## Verification

SHA256 (PDF):

<INSERT SHA256 HASH> ```
This hash uniquely identifies the reviewed artifact.
Scope of Review
Review is limited to:
Mathematical correctness
Logical coherence
Definition adequacy
Dependency clarity
Conditional vs unconditional claims
Out of scope:
Empirical benchmarking
Performance comparisons
Sociological impact
Speculation beyond stated claims
Review Process
All public review occurs via the URF Open Review Ledger.
Review issue:

<LINK TO LEDGER ISSUE>
Feedback must be classified as one of:

ERROR — demonstrable logical or mathematical error
MISSING ASSUMPTION — unstated but required hypothesis
CLARIFICATION — ambiguity or presentation issue
NON-BLOCKING SUGGESTION — optional improvement
Unclassified feedback may be ignored.
Claims Policy
Conditional results are explicitly labeled.
No claim extends beyond stated assumptions.
No empirical or model-specific claims are made unless stated.
Citation
Please cite using the DOI or CITATION.cff.
License
Unless otherwise stated, this manuscript is released under the license specified in the repository.
Notes
This README is part of the URF reproducible publication pipeline.
It is intentionally minimal and reviewer-facing.
