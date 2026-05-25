---
name: validate-idea
description: Validate whether an idea should enter Idea Gate.
---

# Validate Idea

## Purpose

Generate an Idea Validation Artifact for Idea Gate.

## When to use

- A new idea appears
- The problem is still vague
- The user needs a build / refine / reject decision

## Required files to read

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

1. Read the files above.
2. Confirm the task is in Idea Gate.
3. Check whether the problem, user, and evidence are clear.
4. Generate the Idea Validation Artifact.
5. Require Human Owner review and stop.

## Human review

Human Owner must review the artifact and choose `build`, `refine`, or `reject`.

## Stop conditions

- Information is insufficient
- Problem is unclear
- Target user is unclear
- Evidence is missing
- Rollback thinking is missing
- User has not approved the decision step
- There is any automatic commit / push / merge / release risk

## Codex safety rule

Do not automatically commit, push, merge, release, tag, or force-push unless the user explicitly approves that exact action.
