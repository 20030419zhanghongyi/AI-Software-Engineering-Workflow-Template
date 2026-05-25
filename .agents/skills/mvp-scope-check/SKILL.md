---
name: mvp-scope-check
description: Define a small MVP scope before implementation starts.
---

# MVP Scope Check

## Purpose

Generate an MVP Scope Artifact for MVP Gate.

## When to use

- Idea Gate passed and scope must be narrowed
- In-scope or out-of-scope is still unclear
- The user wants an MVP decision

## Required files to read

- AI_WORKFLOW.md
- docs/11_stage_gates.md
- docs/13_human_gate_and_rollback.md
- .ai/artifacts/MVP_SCOPE_ARTIFACT_TEMPLATE.md

## Inputs

- Idea Validation Artifact
- Requirements
- Project constraints

## Outputs

- MVP Scope Artifact
- Decision suggestion: implement / narrow / redesign / pause

## Steps

1. Read the files above.
2. Confirm the task is in MVP Gate.
3. Define one core hypothesis, clear in-scope / out-of-scope, and a success signal.
4. Generate the MVP Scope Artifact.
5. Require Human Owner review and stop.

## Human review

Human Owner must review the artifact and choose `implement`, `narrow`, `redesign`, or `pause`.

## Stop conditions

- Information is insufficient
- In-scope / out-of-scope is unclear
- MVP success signal is missing
- Rollback thinking is missing
- User has not approved the decision step
- There is any automatic commit / push / merge / release risk

## Codex safety rule

Do not automatically commit, push, merge, release, tag, or force-push unless the user explicitly approves that exact action.
