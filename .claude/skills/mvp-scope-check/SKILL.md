---
name: mvp-scope-check
description: Define a small MVP scope before implementation starts.
---

# MVP Scope Check

## Purpose

Generate an MVP Scope Artifact for MVP Gate.

## When to use

- Idea Gate passed and scope must be narrowed
- The user wants an MVP boundary
- In scope / out of scope is still vague

## Read first

- AI_WORKFLOW.md
- docs/11_stage_gates.md
- docs/13_human_gate_and_rollback.md
- .ai/artifacts/MVP_SCOPE_ARTIFACT_TEMPLATE.md

## Inputs

- Idea Validation Artifact
- Current requirements
- Project constraints

## Outputs

- MVP Scope Artifact
- Decision suggestion: implement / narrow / redesign / pause

## Steps

1. Confirm the task is in MVP Gate.
2. Read only the files above.
3. Define one core hypothesis and clear in-scope / out-of-scope lists.
4. Add success signal, constraints, and testing minimum.
5. Ask for Human Owner review and stop.

## Human review

Human Owner must review the artifact and choose `implement`, `narrow`, `redesign`, or `pause`.

## Stop conditions

- In scope is unclear
- Out of scope is unclear
- MVP success signal is missing
- File boundary is unclear
- Rollback thinking is missing
- User has not approved the decision step
- Any action would auto commit / push / merge / release
