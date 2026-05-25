---
name: launch-check
description: Check launch readiness before release decisions.
---

# Launch Check

## Purpose

Generate a Launch Review Artifact for Launch Gate.

## When to use

- A release decision is coming
- The user wants a beta or release check
- Metrics, feedback channels, and rollback must be confirmed

## Read first

- AI_WORKFLOW.md
- docs/11_stage_gates.md
- docs/13_human_gate_and_rollback.md
- .ai/artifacts/LAUNCH_REVIEW_ARTIFACT_TEMPLATE.md

## Inputs

- Review Artifact
- Release goal
- Target users
- Metrics and feedback plan

## Outputs

- Launch Review Artifact
- Decision suggestion: release / private beta / delay / rollback

## Steps

1. Confirm the task is in Launch Gate.
2. Read only the files above.
3. Check release goal, target users, metrics, feedback channels, and rollback plan.
4. Fill the Launch Review Artifact.
5. Ask for Human Owner review and stop.

## Human review

Human Owner must review the artifact and choose `release`, `private beta`, `delay`, or `rollback`.

## Stop conditions

- Release goal is unclear
- Metrics are missing
- Feedback channels are missing
- Rollback plan is missing
- User has not approved the decision step
- Any action would auto release / merge / push / commit
