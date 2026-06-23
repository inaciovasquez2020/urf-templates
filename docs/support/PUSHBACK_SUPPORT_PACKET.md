# Pushback Support Packet

PROJECT := urf-templates

OBJECT := non-URF Ohm's Law fixed-observation bounded demo

CLAIM := a stranger-runnable bounded fixed-observation example exists with an explicit claim boundary and verifier-backed transcript path

DOES_NOT_CLAIM :=
- full theory acceptance
- peer review
- institutional validation
- universal theorem closure
- final scientific confirmation
- broad community acceptance

RUN :=
```bash
python3 examples/non_urf_scientific_claim_demo/tools/verify_ohms_law_fixed_observation_bound.py
python3 -m pytest examples/non_urf_scientific_claim_demo/tests/test_ohms_law_fixed_observation_bound.py
```

EXPECTED :=
```text
NON_URF_OHMS_LAW_FIXED_OBSERVATION_BOUND_OK
1 passed
```

FAILURE_MEANS :=
the first verifier, test, shell, or clean-clone command failure is the authoritative structural gap

INDEPENDENT_SUPPORT_ACTION :=
run the documented verifier/test from a clean clone and report the transcript; do not report broad acceptance

TRACK_ONLY :=
- independent clean-clone runs
- independent verifier transcripts
- downstream reuse
- forks that preserve the bounded claim
- issue references that engage the runnable object

DO_NOT_TRACK_AS_ACCEPTANCE :=
- likes
- vague praise
- private encouragement
- broad philosophical agreement
- institutional endorsement not tied to a runnable transcript

BOUNDARY :=
this packet supports a bounded runnable object against pushback; it does not ask reviewers to accept the whole program
