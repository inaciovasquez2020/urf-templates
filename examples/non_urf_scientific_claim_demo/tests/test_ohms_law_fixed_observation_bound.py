import sys
from pathlib import Path

DEMO_ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(DEMO_ROOT))

from tools.verify_ohms_law_fixed_observation_bound import main


def test_ohms_law_fixed_observation_bound_verifier(capsys):
    main()
    captured = capsys.readouterr()
    assert "NON_URF_OHMS_LAW_FIXED_OBSERVATION_BOUND_OK" in captured.out
