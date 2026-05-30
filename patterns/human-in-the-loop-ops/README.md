# Design Pattern: Human-in-the-Loop Operations

## Problem Class

Automation can move work faster than humans can safely inspect it. Human-in-the-loop design helps teams keep judgment, accountability, and QA inside automated workflows.

## When This Pattern Is Useful

Use this pattern when workflows involve classification, prioritization, external communication, CRM updates, data enrichment, or any action where errors could create operational risk.

## High-Level Workflow

1. Define which actions can be automated.
2. Define which actions require review.
3. Add approval states.
4. Capture reviewer notes.
5. Route exceptions to owners.
6. Log final decisions.
7. Review QA samples and update rules.

## Example Synthetic Scenario

A team uses automation to prepare records for review. The automation suggests a status, but a person approves the final state before the record moves downstream.

All data in this file is synthetic and created for demonstration purposes.

## Data Inputs

- Record ID
- Suggested status
- Confidence level
- Risk flag
- Reviewer
- Final decision
- Review note
- Decision timestamp

## Processing Logic

Automation prepares the record and suggested action. Human reviewers confirm, override, or escalate. The workflow stores both the automated suggestion and the human decision so QA can compare them later.

## Human-in-the-Loop Controls

- Require approval for low-confidence records.
- Require approval for externally visible actions.
- Log reviewer overrides.
- Escalate repeated error patterns.
- Keep audit fields separate from generated fields.

## Dashboard / Reporting Layer

Track review volume, override rate, low-confidence rate, escalation count, unresolved exceptions, average review time, and recurring QA issues.

## Tradeoffs

- More approval gates reduce risk but slow execution.
- Fewer gates increase speed but may allow errors through.
- Reviewer notes improve QA but add manual work.
- Automation suggestions are useful only if humans can inspect them.

## Failure Modes

- Reviewers rubber-stamp outputs.
- Escalations do not have owners.
- Generated fields overwrite reviewer decisions.
- QA checks happen too late.
- The workflow lacks clear stop conditions.

## Tools That Could Be Used

Google Sheets, Airtable, N8N, APIs, LLMs, Postgres, CRM tools, Slack-style notifications, or lightweight internal tools.

## What This Demonstrates

- Approval-gate design
- QA loop thinking
- Exception handling
- Auditability
- Responsible automation design

