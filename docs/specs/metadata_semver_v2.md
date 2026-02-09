URF Metadata Semantic Versioning v2

Version Format
MAJOR.MINOR.PATCH

Compatibility Rules
PATCH:
- schema comments
- documentation updates
- non-structural field additions (optional fields)

MINOR:
- new optional schema sections
- new edge types
- new metadata tables

MAJOR:
- schema breaking change
- canonical serialization change
- hash pipeline change
- DAG structural invariant change

Compatibility Layer
Each repo must expose:
meta/pipeline_version.txt
meta/compatibility_matrix.yaml

Upgrade Rule
v1 metadata must be convertible to v2 via deterministic migration tool.
