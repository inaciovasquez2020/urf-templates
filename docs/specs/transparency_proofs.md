Transparency Log Proof Formats (Inclusion + Consistency)

Log Model
Entries e_i have entry_hash h_i = SHA256(canonical_json(e_i)).
Chain hash:
c_0 = 0^256
c_i = SHA256(c_{i-1} || h_i)

Inclusion Proof (i within [1..n])
Provide:
- e_i (canonical)
- c_{i-1}
Verifier:
recompute h_i then c_i and compare with published c_n via suffix or provided checkpoints.

Consistency Proof (m < n)
Provide:
- head c_m
- entries e_{m+1}..e_n
Verifier:
iterate chain update to obtain c_n.

Optional Merkle Segment Optimization
If entries are batched into a Merkle tree per epoch:
- inclusion proof: Merkle path within epoch + epoch head chain proof.

Required Files
meta/transparency_head.json:
{ "n": uint64, "chain_head": hex, "timestamp": RFC3339, "signature": base64 }

meta/transparency_proof.json:
{ "type": "inclusion"|"consistency", "data": ... }
