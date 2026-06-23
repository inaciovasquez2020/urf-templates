# Canonical 10-minute outsider demo

This demo shows one non-URF scientific claim converted into a bounded, reproducible verification surface.

## Claim

A simple resistor behaves approximately linearly under Ohm's law in a small fixed observation set.

## Bounded claim

For the included fixed observations, every inferred resistance value `V/I` lies within `0.5%` of the declared `1000 ohm` nominal resistance.

## WHAT_THIS_DOES

This demo packages one fixed Ohm's-law observation surface as a bounded, reproducible verification artifact. It checks only the included finite observations, the declared nominal resistance, the declared tolerance, and the explicit non-claim boundary recorded in the artifact.

It is intended as a small outsider-runnable example of claim-boundary packaging: a scientific statement, a fixed dataset, a verifier, expected pass/fail output, and a clear boundary around what is not being claimed.

## WHAT_THIS_DOES_NOT_CLAIM

This demo does not claim discovery or novelty of Ohm's Law.

It does not prove universal Ohm's Law.

It does not validate a physical instrument, establish material linearity outside the listed observations, or infer causation from the fixed dataset.

It does not validate the broader URF research program and does not constitute peer review or scientific certification.

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
