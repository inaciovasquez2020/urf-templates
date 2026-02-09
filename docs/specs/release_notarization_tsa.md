URF Release Notarization (TSA + Signature Chain)

Goal
Make each metadata release tamper-evident with (i) maintainer signature and (ii) external timestamp authority (TSA).

Objects
Release bundle B contains:
- meta/MANIFEST.sha256
- meta/dag.json + meta/dag.sha256
- schemas (meta/*.schema.*)
- meta/pipeline_version.txt
- optional transparency/registry fragments

Release root:
R = SHA256( canonical_bytes(B) ).

Signature
sig = Sign_sk(R).
Verifier checks Verify_pk(R, sig)=true.

TSA Timestamp
Request TSA token over R:
ts = TSA_Timestamp(R).
Verifier checks TSA validity and that ts binds to R.

Chain
Each release stores parent root R_parent:
chain_root = SHA256( R_parent || R ).

Publish
Release artifact includes:
- R, R_parent
- sig
- ts
- bundle hash list

Security
- Signature prevents unauthorized release.
- TSA prevents backdating and supports public audit.
- Chain prevents truncation/rewrite unless collision.

Required Files
meta/release.json:
{
  "release_root": hex,
  "parent_root": hex|null,
  "signature": base64,
  "tsa_token": base64|null,
  "pipeline_version": "MAJOR.MINOR.PATCH",
  "timestamp": RFC3339
}
