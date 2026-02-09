PAC-Bayes Atlas Coverage Bound (Small Counterexamples)

Setup
Let H be a finite or countable hypothesis class of “small counterexample types”.
Let D be an (unknown) distribution over instances/tests.
For h∈H define loss ℓ(h,z)∈[0,1] for test z~D.
True risk:   L(h)=E_{z~D}[ℓ(h,z)].
Empirical risk on n tests z1..zn:
L_n(h)=(1/n)∑_{i=1}^n ℓ(h,zi).

Let π be a prior on H (fixed before seeing data).
Let ρ be any posterior on H (chosen after seeing data).
Let KL(ρ||π)=∑_h ρ(h) log(ρ(h)/π(h)).

PAC-Bayes (one standard form)
For any δ∈(0,1), with probability ≥ 1-δ over the sample:
KL( L_n(ρ) || L(ρ) ) ≤ ( KL(ρ||π) + log((2√n)/δ) ) / n,
where L_n(ρ)=E_{h~ρ}[L_n(h)] and L(ρ)=E_{h~ρ}[L(h)],
and KL(a||b)=a log(a/b) + (1-a) log((1-a)/(1-b)) for Bernoulli parameters.

Consequence (explicit upper bound on L(ρ))
Define ε = ( KL(ρ||π) + log((2√n)/δ) ) / n.
Then any b∈[0,1] satisfying KL(L_n(ρ)||b)=ε yields L(ρ) ≤ b.

Atlas Interpretation
- Each atlas item supplies one or more tests zi (possibly adaptive).
- Choose ρ to concentrate on hypotheses not yet ruled out by the atlas evidence.
- Bound L(ρ) gives an upper bound on the posterior-averaged probability that a small counterexample persists under further testing.

Non-independence / Adaptivity
If tests are chosen adaptively from past outcomes, use a PAC-Bayes-with-martingales variant:
replace iid sampling assumption with a filtration (F_i) and bounded loss increments; the same structure holds with an additional predictable-variance or confidence penalty term.
