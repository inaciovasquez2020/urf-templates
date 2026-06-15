from tools.verify_ohms_law_fixed_observation_bound import main


def test_ohms_law_fixed_observation_bound_verifier(capsys):
    main()
    captured = capsys.readouterr()
    assert "NON_URF_OHMS_LAW_FIXED_OBSERVATION_BOUND_OK" in captured.out
