import sys
import yaml
from pathlib import Path

README = Path("README.md")
SCHEMA = Path("README.schema.yaml")

if not README.exists() or not SCHEMA.exists():
    print("Missing README.md or README.schema.yaml")
    sys.exit(1)

with open(SCHEMA) as f:
    schema = yaml.safe_load(f)

required_sections = [
    "Manuscript Identity",
    "Canonical Artifacts",
    "Verification",
    "Scope of Review",
    "Review Process",
    "Claims Policy",
    "Citation",
    "License",
    "Notes",
]

text = README.read_text()

missing = [s for s in required_sections if s not in text]

if missing:
    print("Missing sections:", missing)
    sys.exit(1)

print("README validation passed")

