# Make/n8n Concept Mapping

This document maps private implementation details to public-safe workflow concepts.

| Concept | Public-safe description |
|---|---|
| Form intake | A trigger that receives structured submissions from a public or internal form |
| Workflow orchestrator | A system like n8n or Make that routes records between tools |
| Spreadsheet/database cockpit | An operational place where teams review, correct, and approve records |
| CRM upsert | Create or update a lifecycle record without duplicating contacts |
| Enrichment | Add public context or derived fields to a raw lead or application |
| AI scoring | Use an LLM or classifier to produce advisory fit, category, or quality signals |
| Human review | A queue where operators approve, reject, edit, or request more research |
| Webhook event | A machine-triggered event that starts or continues a workflow |
| Retry queue | A controlled path for replaying failed operations |
| Incident log | A structured record of what failed, why, and what action is needed |
| Recovery path | A repeatable way to fix and rerun failed or stuck records |

## Example Public Flow

```text
Form intake
  -> workflow orchestrator
  -> validation and dedupe
  -> spreadsheet/database cockpit
  -> human review
  -> CRM/database upsert
  -> notification or access provisioning
  -> incident log and replay path
```

This mapping avoids naming private source systems, real workspaces, exact schemas, or production endpoints.

