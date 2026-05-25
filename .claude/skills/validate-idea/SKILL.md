---
name: validate-idea
description: Validate whether a new idea should enter Idea Gate.
---

# Validate Idea

## Purpose

Generate an Idea Validation Artifact for Idea Gate.

## When to use

- A new product or feature idea appears
- The problem still feels speculative
- The user wants a build / refine / reject decision

## Read first

- AI_WORKFLOW.md
- docs/11_stage_gates.md
- docs/13_human_gate_and_rollback.md
- .ai/artifacts/IDEA_VALIDATION_ARTIFACT_TEMPLATE.md

## Inputs

- Problem statement
- Target user
- Evidence
- Existing alternatives

## Outputs

- Idea Validation Artifact
- Decision suggestion: build / refine / reject

## Steps

1. Confirm the task is in Idea Gate.
2. Read only the files above.
3. Check whether the problem, user, and evidence are clear.
4. Fill the Idea Validation Artifact.
5. Ask for Human Owner review and stop.

## Human review

Human Owner must review the artifact and choose `build`, `refine`, or `reject`.

## Stop conditions

- Problem is unclear
- Target user is unclear
- Evidence is missing
- File boundary is unclear
- Rollback thinking is missing
- User has not approved the decision step
- Any action would auto commit / push / merge / release
