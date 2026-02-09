Weighted DAG Rank + Cross-Edge Merge Condition

1. Weighted DAG
Let G=(V,E,w) with w:E→R_{>0}. For a directed path π=(e1,...,ek), define weight W(π)=∑_{j=1}^k w(ej).

Define weighted rank:
r_G(v) = sup { W(π) : π is a directed path from any root to v }.
For finite DAG and positive weights, sup is max.

2. Merge Setting
Let G1=(V1,E1,w1), G2=(V2,E2,w2) be DAGs with common subgraph G0 identified in both.
Let merged graph be pushout union plus cross edges E× with weights w×, yielding G.

3. Weighted Cross-Edge Admissibility
For each cross edge (u→v)∈E× from source side S to destination side T, require:
(⋆w)   r_{G_S}(u) + w×(u→v) ≤ r_{G_T}(v).

4. Stability Theorem
Assume:
(i) G is acyclic,
(ii) (⋆w) holds for all cross edges.
Then for any v∈V1, r_G(v)=r_{G1}(v); for any v∈V2, r_G(v)=r_{G2}(v).
Equivalently, cross edges do not increase weighted longest-path values in either component.

5. Converse (Equivalence)
If for all v∈V1 we have r_G(v)=r_{G1}(v) and for all v∈V2 we have r_G(v)=r_{G2}(v),
then (⋆w) holds for every cross edge, since otherwise concatenation would strictly increase r_G at v.
