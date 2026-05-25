---
name: plan-from-issue
description: Create a Plan Artifact before implementation begins.
---

# Plan From Issue

## Purpose

Generate a Plan Artifact for Implementation Gate.

## When to use

- A coding task is ready for planning
- Allowed files and tests need to be defined
- Implementation must not start yet

## Read first

- AGENTS.md
- AI_WORKFLOW.md
- docs/11_stage_gates.md
- docs/13_human_gate_and_rollback.md
- .ai/artifacts/PLAN_ARTIFACT_TEMPLATE.md

## Inputs

- Current issue or task
- Relevant files
- Relevant constraints

## Outputs

- Plan Artifact

## Steps

1. Confirm the task is in Implementation Gate.
2. Read only the files above and the minimum relevant project files.
3. Define allowed files, forbidden files, test plan, and rollback plan.
4. Fill the Plan Artifact.
5. Require Human Owner approval before implementation and stop.

## Human review

Human Owner must approve the plan, especially file scope, tests, and rollback plan.

## Stop conditions

- Information is insufficient
- File boundary is unclear
- Test plan is missing
- Rollback plan is missing
- User has not approved the plan
- Any action would auto commit / push / merge / release
