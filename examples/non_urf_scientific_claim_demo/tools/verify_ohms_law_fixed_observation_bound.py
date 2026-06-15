#!/usr/bin/env python3
"""Verify the fixed-dataset Ohm's law bounded-claim demo."""

from __future__ import annotations

import json
from pathlib import Path

ARTIFACT = (
    Path(__file__).resolve().parents[1]
    / "artifacts"
    / "non_urf"
    / "ohms_law_fixed_observation_bound_2026_06_15.json"
)

REQUIRED_TOP_LEVEL_FIELDS = {
    "artifact_id",
    "artifact_type",
    "domain",
    "non_urf_scientific_claim",
    "bounded_claim",
    "nominal_resistance_ohm",
    "relative_tolerance",
    "observations",
    "required_checks",
    "non_claim_boundary",
    "copy_sentence",
}

REQUIRED_CHECKS = {
    "schema_fields_present",
    "currents_are_positive",
    "each_inferred_resistance_within_relative_tolerance",
    "non_claim_boundary_present",
}


def load_artifact() -> dict:
    with ARTIFACT.open("r", encoding="utf-8") as handle:
        return json.load(handle)


def verify_schema(data: dict) -> None:
    missing = REQUIRED_TOP_LEVEL_FIELDS - set(data)
    if missing:
        raise SystemExit(f"missing required fields: {sorted(missing)}")
    checks = set(data["required_checks"])
    missing_checks = REQUIRED_CHECKS - checks
    if missing_checks:
        raise SystemExit(f"missing required checks: {sorted(missing_checks)}")


def verify_observations(data: dict) -> None:
    nominal = float(data["nominal_resistance_ohm"])
    tolerance = float(data["relative_tolerance"])
    observations = data["observations"]
    if not observations:
        raise SystemExit("observations must be nonempty")
    if nominal <= 0:
        raise SystemExit("nominal_resistance_ohm must be positive")
    if tolerance <= 0:
        raise SystemExit("relative_tolerance must be positive")

    for index, observation in enumerate(observations):
        voltage = float(observation["voltage_v"])
        current = float(observation["current_a"])
        if current <= 0:
            raise SystemExit(f"observation {index} has nonpositive current")
        inferred_resistance = voltage / current
        relative_error = abs(inferred_resistance - nominal) / nominal
        if relative_error > tolerance:
            raise SystemExit(
                "observation {idx} outside tolerance: inferred={resistance:.12g}, "
                "relative_error={error:.12g}, tolerance={tolerance:.12g}".format(
                    idx=index,
                    resistance=inferred_resistance,
                    error=relative_error,
                    tolerance=tolerance,
                )
            )


def verify_boundary(data: dict) -> None:
    boundary = data["non_claim_boundary"]
    if not isinstance(boundary, list) or len(boundary) < 4:
        raise SystemExit("non_claim_boundary must contain at least four explicit non-claims")
    joined = " ".join(boundary).lower()
    required_phrases = ["universal", "instrument", "outside", "causation"]
    missing = [phrase for phrase in required_phrases if phrase not in joined]
    if missing:
        raise SystemExit(f"non_claim_boundary missing phrases: {missing}")
    if data["copy_sentence"] != "Copy this pattern for your own claim.":
        raise SystemExit("copy_sentence mismatch")


def main() -> None:
    data = load_artifact()
    verify_schema(data)
    verify_observations(data)
    verify_boundary(data)
    print("NON_URF_OHMS_LAW_FIXED_OBSERVATION_BOUND_OK")


if __name__ == "__main__":
    main()
