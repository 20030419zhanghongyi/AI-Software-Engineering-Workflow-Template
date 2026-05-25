---
name: launch-check
description: Check launch readiness before release decisions.
---

# Launch Check

## Purpose

Generate a Launch Review Artifact for Launch Gate.

## When to use

- A release decision is coming
- Metrics or feedback channels must be checked
- The user wants a beta or release recommendation

## Required files to read

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

1. Read the files above.
2. Check that the task is in Launch Gate.
3. Review release goal, target users, metrics, feedback channels, and rollback plan.
4. Generate the Launch Review Artifact.
5. Require Human Owner review and stop.

## Human review

Human Owner must review the artifact and choose `release`, `private beta`, `delay`, or `rollback`.

## Stop conditions

- Release goal is unclear
- Metrics are missing
- Feedback channels are missing
- Rollback plan is missing
- User has not approved the decision step
- There is any automatic commit / push / merge / release risk

## Codex safety rule

Do not automatically commit, push, merge, release, tag, or force-push unless the user explicitly approves that exact action.
