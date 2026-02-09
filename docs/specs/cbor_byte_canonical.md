CBOR Byte-Level Canonicalization: Uniqueness Without Injectivity Axioms

Goal
Prove: canonicalCBOR(x)=canonicalCBOR(y) ⇒ normalize(x)=normalize(y),
by reducing equality to byte-level canonical form uniqueness.

Canonical Serialization Pipeline
1) Normalize Lean AST
- α-normalize binders (canonical De Bruijn or canonical name mapping)
- erase whitespace/comments
- fix universe/implicit arguments representation (canonical explicit form)
Result: AST_norm ∈ AST.

2) Canonicalize YAML schema fragment
- parse YAML to an internal tree
- map scalars to canonical forms (UTF-8, normalized floats/ints/strings)
- sort mapping keys lexicographically
Result: Y_norm ∈ Y.

3) Encode pair (AST_norm, Y_norm) into canonical CBOR bytes:
- definite-length arrays/maps only
- shortest integer encodings
- map keys sorted by canonical CBOR bytes (RFC 8949 canonical CBOR)
- no NaN payload variability (either forbid or canonicalize)
Result: bytes B ∈ {0,1}*.

Byte-Level Uniqueness Lemma (canonical CBOR)
For canonical CBOR encoding function enc_can:
enc_can(t1)=enc_can(t2) ⇒ t1=t2.
Proof is by structural decoding determinism:
- canonical form admits a unique parse tree from bytes
- sorted-map constraint prevents multiple representations.

Therefore
canonicalCBOR(L) := enc_can( AST_norm(L), Y_norm(L) )
and
canonicalCBOR(L1)=canonicalCBOR(L2)
⇒ (AST_norm(L1),Y_norm(L1))=(AST_norm(L2),Y_norm(L2))
⇒ AST_norm(L1)=AST_norm(L2) and Y_norm(L1)=Y_norm(L2)
⇒ normalize(L1)=normalize(L2).

Lean Formalization Outline
- Define an inductive CBOR term language (major types + definite lengths).
- Define enc_can : CBORTerm → ByteArray with canonicality constraints.
- Prove: decode(enc_can t)=some t (left-inverse) and decode deterministic.
- Conclude enc_can injective by left-inverse.

No external “injectivity axioms” required; only correctness of decode(enc_can ·).
