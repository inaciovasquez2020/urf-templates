# Traditional Publication vs Verifier-Backed Publication

## Purpose

This document compares a normal publication workflow with the bounded
verifier-backed workflow used by this demo.

## Traditional publication path

```text
claim -> manuscript -> reviewer interpretation -> acceptance/rejection
Strengths:
Human judgment can evaluate novelty, relevance, and context.
Reviewers can challenge assumptions and presentation.
Journals provide social and archival signals.
Boundaries:
The reader may not receive a runnable artifact.
Claim boundaries may be implicit.
Reproduction may require private interpretation or unavailable setup.
Missing assumptions may remain mixed with prose.
Verifier-backed publication path
claim -> artifact -> verifier -> test -> boundary -> adoption note
Strengths:
The checked claim is tied to a runnable command.
The boundary says what is not proved.
Missing objects are explicit instead of hidden in prose.
A stranger can test the artifact without trusting the author personally.
Boundaries:
The verifier does not replace expert review.
The verifier does not prove claims outside its encoded boundary.
The demo does not claim new physics, peer review, or external adoption.
External adoption is not claimed until an independent user or project uses it.
Bounded conclusion
The verifier-backed path is not a replacement for publication. It is a
scalable trust layer that can sit before, beside, or after publication by making
one bounded claim independently runnable.
