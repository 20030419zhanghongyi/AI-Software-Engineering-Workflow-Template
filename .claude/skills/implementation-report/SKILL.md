---
name: implementation-report
description: Summarize what was implemented before Review Gate.
---

# Implementation Report

## Purpose

Generate an Implementation Report after execution.

## When to use

- Implementation work is finished
- Review Gate is next
- The user needs a structured execution summary

## Read first

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

1. Read the plan, diff, commands, and tests.
2. Confirm what actually changed.
3. Record files modified, commands run, tests run, plan deviations, and risks.
4. Fill the Implementation Report.
5. Ask for Human Owner review and stop.

## Human review

Human Owner must review whether the implementation matched the plan and whether risks are acceptable.

## Stop conditions

- Information is insufficient
- File boundary is unclear
- Commands or tests were not recorded
- Plan deviation cannot be explained
- User has not approved the review step
- Any action would auto commit / push / merge / release
