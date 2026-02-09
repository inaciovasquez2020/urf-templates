Repo Federation as a Stack (Descent for Merges)

Site
Objects: repositories (or repo-snapshots).
Morphisms: embeddings/restrictions induced by shared subtrees (meta/, atlas/, tools/) and pinned lemma imports.

Grothendieck Topology
A cover of R is a family {ui: Ri → R} such that:
- each Ri embeds into R (shared overlap)
- overlaps Rij := Ri ×_R Rj exist (computed as intersection of shared files + pinned lemma nodes)
- union of images covers the metadata layer of R (meta+atlas+tools+CI).

Fibered Category (groupoid-valued)
Let G(R) be the groupoid of “metadata packages over R”:
Objects: (lemmas.yaml, deps.yaml, constants.yaml, schemas, tools hashes, manifest hash).
Morphisms: isomorphisms preserving canonical hashes and schema validity.

Presheaf ⇒ Stack Upgrade
Define pullback functors:
G(f): G(R) → G(S) for morphism f:S→R by restriction (pull back the package to S).

Descent Data
Given a cover {Ri→R}:
- objects xi ∈ G(Ri)
- isomorphisms φij: xi|Rij ≅ xj|Rij
satisfying cocycle condition on triple overlaps:
φjk ∘ φij = φik on Rijk.

Stack Condition
If descent data holds, then:
∃! (up to unique iso) x ∈ G(R) such that x|Ri ≅ xi and induces φij.

Operational Merge Consequence
- Repo merge is valid iff local metadata packages agree on overlaps (hash- and schema-consistent).
- Global lemma graph glues uniquely from consistent repo-local graphs.
