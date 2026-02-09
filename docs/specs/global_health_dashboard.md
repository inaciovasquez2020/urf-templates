Global URF Health Dashboard Schema

Metrics

DAG Health
- acyclic: bool
- node_count
- edge_count
- max_rank_depth

Manifest Health
- manifest_valid: bool
- hash_match_rate

CI Health
- last_pass_timestamp
- failure_rate_30d

Sync Health
- repo_sync_lag
- template_sync_status

Atlas Health
- atlas_size
- coverage_estimate
- pac_bayes_upper_bound

Display
JSON endpoint per repo:
meta/health_status.json

Aggregator
Global dashboard = union + weighted summary.
