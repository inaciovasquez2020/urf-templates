URF Conflict Resolution — Minimal Procedure

1) Detect
   git status

2) If metadata layer (meta/, atlas/, tools/):
   - Prefer deterministic outputs:
     ./tools/compile_dag.py
     ./tools/verify_dag.py
     ./tools/verify_manifest.py
   - Then:
     git add meta/ atlas/ tools/
     git rebase --continue

3) If .gitignore:
   - Keep union of entries (no deletions unless intentional)
   - git add .gitignore
   - git rebase --continue

4) If workflows:
   - Keep newest job blocks + deterministic checks
   - git add .github/workflows/
   - git rebase --continue

5) Abort if unsure:
   git rebase --abort
