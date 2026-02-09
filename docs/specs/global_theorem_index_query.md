Global URF Theorem Index + Query Schema

Purpose
Provide a federation-wide searchable index of theorems/lemmas with stable identifiers and verified dependency links.

Index Entry
{
  "key_global": K_global,
  "H_L": hex,
  "title": string,
  "statement_ref": { "repo": repoID, "path": string, "span": string|null },
  "tags": [string],
  "regime": string,
  "depends_on": [K_global],
  "supersedes": [K_global],
  "status": "active"|"deprecated"|"superseded",
  "introduced_in_release": hex,
  "metadata_hash": hex
}

Query Schema
meta/query.json:
{
  "q": string,
  "tags": [string]?,
  "repo": repoID?,
  "regime": string?,
  "status": string?,
  "limit": int?,
  "offset": int?
}

Response
meta/query_result.json:
{
  "total": int,
  "results": [IndexEntry]
}

Determinism
Given frozen repo snapshots, the index and query responses are deterministic.
