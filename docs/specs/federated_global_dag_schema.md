Federated Global URF DAG Schema

Goal
Define a canonical multi-repo lemma graph G_URF.

Node Identity
Each node is keyed by:
K_global(L) = repoID || modulePath || lemmaName || H_L

Node Fields
- key: K_global
- repo: repoID
- lemma_hash: H_L
- namespace: repoID/modulePath/lemmaName
- schema_version
- metadata_hash

Edge Types
- depends_on
- supersedes
- equivalent_to
- imported_from

Global DAG Rules
1. DAG must remain acyclic.
2. Cross-repo edges must satisfy rank monotonicity.
3. Namespace collisions forbidden.
4. Hash mismatch invalidates node.

Federation Merge
Global graph = union of repo DAGs + validated cross edges.
