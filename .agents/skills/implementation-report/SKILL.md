---
name: implementation-report
description: Summarize implementation work before Review Gate.
---

# Implementation Report

## Purpose

Generate an Implementation Report after execution.

## When to use

- Implementation work is finished
- Review Gate is next
- The user needs a structured execution summary

## Required files to read

- AI_WORKFLOW.md
- docs/11_stage_gates.md
- .ai/artifacts/IMPLEMENTATION_REPORT_TEMPLATE.md
- Current Plan Artifact

## Inputs

- Plan Artifact
- git diff
- Commands run
- Tests run

## Outputs

- Implementation Report

## Steps

1. Read the files above.
2. Check what changed against the plan.
3. Record files modified, commands run, tests run, deviations, and risks.
4. Generate the Implementation Report.
5. Require Human Owner review and stop.

## Human review

Human Owner must review whether implementation matched the plan and whether risks are acceptable.

## Stop conditions

- Information is insufficient
- Commands or tests are missing
- Plan deviation cannot be explained
- User has not approved the review step
- There is any automatic commit / push / merge / release risk

## Codex safety rule

Do not automatically commit, push, merge, release, tag, or force-push unless the user explicitly approves that exact action.
