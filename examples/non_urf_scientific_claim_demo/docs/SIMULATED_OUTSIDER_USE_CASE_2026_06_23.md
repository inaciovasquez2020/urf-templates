# Simulated Outsider Use Case

## Purpose

This note records a bounded simulated outsider use case for the non-URF
scientific claim demo.

## User position

A stranger wants to evaluate whether the repository provides a runnable
verifier-backed publication workflow without trusting the author personally.

## Minimal action

From a fresh clone, the stranger runs:

```sh
cd examples/non_urf_scientific_claim_demo
python3 tools/verify_ohms_law_fixed_observation_bound.py
python3 -m pytest tests/test_ohms_law_fixed_observation_bound.py
Expected result
NON_URF_OHMS_LAW_FIXED_OBSERVATION_BOUND_OK
and:
1 passed
What the outsider learns
The outsider can confirm that the demo has:
a bounded claim surface,
a runnable verifier,
a targeted test,
an explicit boundary note,
and a publication-workflow comparison.
Boundary
This is a simulated outsider use case. It does not claim actual independent
external adoption. External adoption is only claimed after an independent user
or project runs and uses the workflow.
