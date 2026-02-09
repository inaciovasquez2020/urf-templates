Merkle DAG Ancestry Uniqueness Without Global Hash Injectivity

Model
Node content: C = (release_payload, parent_hashes[]).
Node hash: M = H( serialize(C) ).

Validity
valid(node) := node.hash = H(serialize(node.content)).

Ancestry
ancestry(M) := the set (or ordered list) of hashes reachable from M following parent_hashes, together with the corresponding contents where available.

Uniqueness Statement (collision-resistance form)
Let two valid nodes n1,n2 satisfy hash(n1)=hash(n2).
Then either:
(A) serialize(content(n1)) = serialize(content(n2)), hence content(n1)=content(n2) and ancestry identical, or
(B) a hash collision exists: H(x)=H(y) with x≠y.

Thus, without assuming injectivity, we obtain:
hash(n1)=hash(n2) ∧ valid(n1) ∧ valid(n2) ∧ NO-COLLISION-ON-ENCODED-CONTENTS
⇒ content(n1)=content(n2) ⇒ ancestry(n1)=ancestry(n2).

Fork-resolution uniqueness (practical)
If your release policy enforces that every published node includes:
- its own content bytes
- its parent hash list
- and (optionally) parent content bytes
then any competing fork with identical tip hash must match all content bytes unless it exhibits a collision.
Hence “uniqueness up to collision” is achieved.

Lean Lemma Shape
theorem ancestry_unique_upto_collision :
  valid n1 → valid n2 → hash n1 = hash n2 →
  (serialize (content n1) = serialize (content n2) ∨ CollisionWitness H) ∧
  (serialize (content n1) = serialize (content n2) → ancestry n1 = ancestry n2).
