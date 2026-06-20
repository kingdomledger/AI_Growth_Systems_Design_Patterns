# Onboarding & Registration Automation

This synthetic example shows how a messy registration process can become a controlled onboarding workflow with review, deduplication, CRM/database sync, access provisioning, notifications, and recovery paths.

## Workflow

1. Receive a form submission.
2. Normalize identity and application fields.
3. Check for duplicates or prior decisions.
4. Route eligible records to human review.
5. Approve, reject, or revoke access.
6. Sync the decision to an operational database and CRM.
7. Trigger the right notification.
8. Capture failures for replay and operator follow-up.

## Design Notes

- The review queue is the source of human decisions.
- Provisioning is idempotent, so repeated approvals do not duplicate access.
- Rejections and revocations are separate outcomes even if both remove access.
- Recovery records preserve the original event, error category, and next action.

## Files

- [diagram.mmd](./diagram.mmd): Mermaid workflow diagram
- [sample-input.json](./sample-input.json): synthetic registration payload
- [sample-output.json](./sample-output.json): synthetic reviewed/provisioned result

## Sanitization

This example does not include real form names, wallet addresses, user records, access rules, private schemas, workflow IDs, or production endpoints.

