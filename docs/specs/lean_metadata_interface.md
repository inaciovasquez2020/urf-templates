Lean Interface for URF Metadata Invariants

Goal
Expose a minimal Lean layer capturing URF metadata objects and invariants.

Core Types
- RepoID
- LemmaKeyGlobal (K_global)
- LemmaHash (H_L)
- DAG (nodes, edges)
- Manifest (path → sha256)
- ReleaseRoot, Signature, TSA token

Core Predicates
- ManifestValid : Manifest → Prop
- SchemaValid : Meta → Prop
- Acyclic : DAG → Prop
- NamespaceOK : Meta → Prop
- ReleaseValid : Release → Prop

Key Theorems (schemas)
1. (Manifest Soundness)
ManifestValid M → ∀p, hash(file p)=M[p]

2. (DAG Acyclicity Preservation)
Acyclic G → (admissible_merge G G') → Acyclic (merge G G')

3. (Namespace Collision-Free)
NamespaceOK Meta → Injective K_global (up to hash collision)

4. (Release Verification)
ReleaseValid R → ManifestValid ∧ SchemaValid ∧ Acyclic

5. (Monotonicity)
AppendOnly → ∂t |V(G_t)| ≥ 0

Export
Define a Lean module:
URF.Metadata.Interface
containing structures + theorems as stubs, later linked to verifiers.
