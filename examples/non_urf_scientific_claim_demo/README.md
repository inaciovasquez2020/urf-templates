# Canonical 10-minute outsider demo

This demo shows one non-URF scientific claim converted into a bounded, reproducible verification surface.

## Claim

A simple resistor behaves approximately linearly under Ohm's law in a small fixed observation set.

## Bounded claim

For the included fixed observations, every inferred resistance value `V/I` lies within `0.5%` of the declared `1000 ohm` nominal resistance.

## Run

```bash
python3 tools/verify_ohms_law_fixed_observation_bound.py
python3 -m pytest tests/test_ohms_law_fixed_observation_bound.py -q
```

Expected verifier output:

```text
NON_URF_OHMS_LAW_FIXED_OBSERVATION_BOUND_OK
```

Expected pytest output includes:

```text
1 passed
```

## Artifact

The bounded claim is encoded at:

```text
artifacts/non_urf/ohms_law_fixed_observation_bound_2026_06_15.json
```

## Non-claim boundary

This artifact does not claim universal Ohm's law, does not validate a physical instrument, does not establish material linearity outside the listed observations, and does not infer causation from the fixed dataset.

Copy this pattern for your own claim.
