# Outsider run request

Please run only the canonical 10-minute outsider demo and report whether the pattern is understandable without extra explanation.

Steps:

```bash
git clone https://github.com/inaciovasquez2020/urf-templates.git
cd urf-templates/examples/non_urf_scientific_claim_demo
python3 tools/verify_ohms_law_fixed_observation_bound.py
python3 -m pytest tests/test_ohms_law_fixed_observation_bound.py -q
```

Then answer:

1. Did both commands pass?
2. Could you identify the claim, bounded claim, JSON artifact, verifier, test, and non-claim boundary?
3. Could you copy this pattern for a claim of your own without help?
