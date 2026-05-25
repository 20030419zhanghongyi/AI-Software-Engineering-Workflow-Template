---
name: review-artifact
description: Prepare a Review Artifact before merge decisions.
---

# Review Artifact

## Purpose

Generate a Review Artifact for Review Gate.

## When to use

- Implementation is complete
- A PR or diff needs structured review
- Merge should be evaluated but not executed

## Required files to read

- AI_WORKFLOW.md
- docs/11_stage_gates.md
- docs/13_human_gate_and_rollback.md
- .ai/artifacts/REVIEW_ARTIFACT_TEMPLATE.md

## Inputs

- git diff
- Implementation Report
- Test results
- Relevant docs

## Outputs

- Review Artifact
- Merge recommendation

## Steps

1. Read the files above.
2. Check that the task is in Review Gate.
3. Summarize diff, architecture impact, module boundary check, tests, and risks.
4. Generate the Review Artifact.
5. Require Human Owner review and stop.

## Human review

Human Owner must review the artifact and choose `merge`, `request changes`, `rollback`, or `abandon`.

## Stop conditions

- Information is insufficient
- File boundary is unclear
- Test result is missing
- Rollback thinking is missing
- User has not approved the review step
- There is any automatic commit / push / merge / release risk

## Codex safety rule

Do not automatically commit, push, merge, release, tag, or force-push unless the user explicitly approves that exact action.
