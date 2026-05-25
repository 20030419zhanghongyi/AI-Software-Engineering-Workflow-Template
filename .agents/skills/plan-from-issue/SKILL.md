---
name: plan-from-issue
description: Create a Plan Artifact before implementation starts.
---

# Plan From Issue

## Purpose

Generate a Plan Artifact for Implementation Gate.

## When to use

- A coding task is ready for planning
- Allowed files and tests need to be defined
- Implementation must wait for approval

## Required files to read

- AGENTS.md
- AI_WORKFLOW.md
- docs/11_stage_gates.md
- docs/13_human_gate_and_rollback.md
- .ai/artifacts/PLAN_ARTIFACT_TEMPLATE.md

## Inputs

- Current issue or task
- Relevant files
- Current constraints

## Outputs

- Plan Artifact

## Steps

1. Read the files above.
2. Check that the task is in Implementation Gate.
3. Define allowed files, forbidden files, test plan, and rollback plan.
4. Generate the Plan Artifact.
5. Require Human Owner approval before implementation and stop.

## Human review

Human Owner must approve the plan, especially scope, tests, and rollback.

## Stop conditions

- Information is insufficient
- File boundary is unclear
- Test plan is missing
- Rollback plan is missing
- User has not approved the plan
- There is any automatic commit / push / merge / release risk

## Codex safety rule

Do not automatically commit, push, merge, release, tag, or force-push unless the user explicitly approves that exact action.
