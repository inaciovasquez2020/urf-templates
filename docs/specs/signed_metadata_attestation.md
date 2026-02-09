Signed Metadata Attestation (Supply Chain Grade)

Release Artifact
Contains:
- MANIFEST.sha256
- dag.json
- schemas
- atlas index
- pipeline version

Merkle Release Root
R_i = H( MANIFEST || DAG || SCHEMAS || VERSION )

Signature Layer
sig_i = Sign_private(R_i)

Verification
Verify signature
Verify manifest hashes
Verify DAG hash
Verify schema version

Attestation Chain
Each release includes:
parent_release_root

Forms Merkle DAG of releases.

Security Goal
Tamper-evident metadata supply chain.
