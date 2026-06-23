# urf-templates

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.20703237.svg)](https://doi.org/10.5281/zenodo.20703237)

[Canonical 10-minute outsider demo](examples/non_urf_scientific_claim_demo/) — one non-URF scientific claim converted into a bounded JSON artifact, verifier command, passing test, and explicit non-claim boundary.

Reusable URF adoption templates and outsider demos

## Five-minute verification path

Clean-clone confirmation: [Clean-clone adoption confirmation](examples/non_urf_scientific_claim_demo/docs/CLEAN_CLONE_ADOPTION_CONFIRMATION_2026_06_23.md).

This repository contains a small, stranger-runnable example of a
verifier-backed publication workflow.

The strongest current entry point is the non-URF scientific claim demo:

```sh
cd examples/non_urf_scientific_claim_demo
python3 tools/verify_ohms_law_fixed_observation_bound.py
python3 -m pytest tests/test_ohms_law_fixed_observation_bound.py
Expected verifier result:
NON_URF_OHMS_LAW_FIXED_OBSERVATION_BOUND_OK
Workflow shape:
claim -> artifact -> verifier -> boundary -> adoption note
Bounded claim:
The demo verifies a fixed-observation Ohm's Law boundary artifact and its
associated test surface. It does not claim new physics, universal scientific
validation, peer review, or external adoption.
Adoption status:
This is a runnable adoption surface for outsider evaluation. External adoption
is not claimed until an independent user or project runs and uses the workflow.
