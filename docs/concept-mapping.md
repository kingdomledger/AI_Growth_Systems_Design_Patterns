# Concept Mapping

This document maps specific implementation patterns to public-safe workflow concepts.

| Concept | Public-safe description |
|---|---|
| Form intake | Trigger that receives structured applications, requests, or lead records |
| Workflow orchestrator | System that routes records between tools and decision paths |
| Operational cockpit | Spreadsheet or database where operators review, correct, and approve records |
| CRM/lifecycle upsert | Create or update a downstream record without duplicating it |
| Enrichment | Add public context or derived fields to a raw record |
| AI scoring | Use an LLM or classifier to produce advisory fit, category, or quality signals |
| Human gate | Operator approval point before outbound or irreversible action |
| Outbound handoff | Queue approved records for notification, email, or lifecycle action |
| Retry/rerun control | Controlled path for replaying failed or stale records |
| Incident record | Structured record of what failed, why, and what action is needed |
| Sync repair | Operator-safe way to reconcile mismatched workflow/database states |

## Example Public Flow

```text
Intake
  -> validation and dedupe
  -> enrichment or classification
  -> operational review queue
  -> approval handoff
  -> downstream sync or outbound queue
  -> incident record and repair path
```

