URF Federation Risk + SLO Scoring

Health Vector per repo R
H_R ∈ {0,1}^5:
- CI_pass
- manifest_valid
- dag_acyclic
- schema_valid
- template_sync

Risk Score
risk(R) = 1 - (1/5)∑ H_R(i).

Federation Risk
risk(URF) = (1/|R|)∑ risk(R).

SLO Targets (examples)
- CI_pass rate ≥ 0.99 over 30d
- manifest_valid = 1 always on main
- dag_acyclic = 1 always
- template_sync lag ≤ 7 days
- federation_consistency_verifier: PASS on every PR

Severity Levels
- SEV0: cycle detected / manifest mismatch / signature invalid
- SEV1: schema mismatch / cross-repo namespace conflict
- SEV2: template drift / CI flaky
- SEV3: doc-only deviations

Required Output
meta/slo_status.json:
{
  "repo": repoID,
  "risk": float,
  "sev": "SEV0"|"SEV1"|"SEV2"|"SEV3"|"OK",
  "violations": [string],
  "timestamp": RFC3339
}
