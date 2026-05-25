---
name: scale-automation-review
description: Evaluate whether a repeated workflow should be automated.
---

# Scale Automation Review

## Purpose

Generate a Scale Automation Review Artifact for Scale Gate.

## When to use

- A workflow has repeated several times
- The user wants to formalize a process
- Automation risk must be reviewed first

## Required files to read

- AI_WORKFLOW.md
- docs/11_stage_gates.md
- docs/13_human_gate_and_rollback.md
- .ai/artifacts/SCALE_AUTOMATION_REVIEW_TEMPLATE.md

## Inputs

- Repeated workflow
- Frequency
- Human judgment needs
- Current pain points

## Outputs

- Scale Automation Review Artifact
- Decision suggestion: automate / keep manual / observe more

## Steps

1. Read the files above.
2. Check that the task is in Scale Gate.
3. Record repeated workflow, frequency, judgment needs, suggested automation form, and risks.
4. Generate the Scale Automation Review Artifact.
5. Require Human Owner review and stop.

## Human review

Human Owner must decide whether to automate, keep manual, or observe more.

## Stop conditions

- Workflow is not actually repeated
- Human judgment needs are unclear
- Suggested automation form is unclear
- Manual fallback is missing
- User has not approved the decision step
- There is any automatic commit / push / merge / release risk

## Codex safety rule

Do not automatically commit, push, merge, release, tag, or force-push unless the user explicitly approves that exact action.
