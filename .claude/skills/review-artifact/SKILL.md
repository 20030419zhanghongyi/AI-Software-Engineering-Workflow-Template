---
name: review-artifact
description: Prepare a compact Review Artifact before merge decisions.
---

# Review Artifact

## Purpose

Generate a Review Artifact for Review Gate.

## When to use

- Implementation is complete
- A PR or diff needs structured review
- Merge should be evaluated but not executed

## Read first

- AI_WORKFLOW.md
- docs/11_stage_gates.md
- docs/13_human_gate_and_rollback.md
- .ai/artifacts/REVIEW_ARTIFACT_TEMPLATE.md

## Inputs

- git diff
- Implementation Report
- Test results
- Relevant architecture or boundary docs

## Outputs

- Review Artifact
- Merge recommendation

## Steps

1. Confirm the task is in Review Gate.
2. Read only the files above.
3. Summarize diff, architecture impact, boundary check, tests, and risks.
4. Fill the Review Artifact with a merge recommendation.
5. Ask for Human Owner review and stop.

## Human review

Human Owner must review the artifact and choose whether to merge, request changes, rollback, or abandon.

## Stop conditions

- Information is insufficient
- File boundary is unclear
- Test result is missing
- Rollback thinking is missing
- User has not approved the review step
- Any action would auto merge / release / push / commit
