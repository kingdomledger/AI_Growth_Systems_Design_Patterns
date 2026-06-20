# Member Onboarding Automation

Sanitized case study based on onboarding and registration workflows with review decisions, access provisioning, admin override, and repair paths.

## What This Is Based On

- Form-based application intake
- Workflow-orchestrated review processing
- Approve, reject, revoke, and admin override paths
- Access sync and notification steps
- Repair scripts for stuck or inconsistent review states

## What It Demonstrates

- Member/application intake
- Duplicate and prior-status checks
- Human review queue
- Approve/reject/revoke decisions
- Access provisioning and notification handoff
- Admin override for reversible decisions
- Sync repair and audit records

## How It Works

1. A synthetic application enters through form intake.
2. The workflow normalizes identity and application fields.
3. Prior records are checked before creating or updating the review item.
4. A reviewer approves, rejects, revokes, or uses an admin override.
5. The decision updates the operational record and downstream access state.
6. Sync issues are routed to operator repair instead of being hidden.
7. The final state is written as a completed audit record.

## What Was Sanitized

This example removes vertical-specific labels, real applicants, private access rules, exact sheet/database schemas, workspace names, provider names, and production endpoints.

## What To Notice

The important pattern is not just intake automation. It is controlled state management: review decisions, reversible overrides, access sync, and repair paths when the automation and operational record drift.

## Files

- [diagram.mmd](./diagram.mmd): workflow map
- [sample-input.json](./sample-input.json): synthetic application event
- [sample-output.json](./sample-output.json): synthetic final decision/audit record

