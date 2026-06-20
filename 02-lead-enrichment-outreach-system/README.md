# Lead Enrichment & Outreach System

A workflow for turning rough lead inputs into enriched, reviewed, handoff-ready records.

## Context

- Based on lead intake, enrichment, and review queue workflows
- Separates enrichment/review from outbound execution
- Covers approval snapshots, queue handoff, events, replies, cancellation, and reruns

## Architecture

```mermaid
flowchart TD
  A[Lead intake cockpit] --> B[Normalize and dedupe]
  B --> C{Existing lead?}
  C -- Yes --> D[Existing record review]
  C -- No --> E[Enrichment stage]
  E --> F[AI fit analysis]
  F --> G[Draft recommendation]
  G --> H{Human review decision}
  H -- Rejected --> I[Archive rejected lead]
  H -- Needs edit or rerun --> J[Review or rerun queue]
  J --> G
  H -- Approved --> K[Approved snapshot]
  K --> L{Cancel before handoff?}
  L -- Yes --> M[Cancellation record]
  L -- No --> P[Outbound queue handoff]
  P --> Q[Delivery event]
  P --> R[Reply event]
  Q --> S[Reporting sync]
  R --> S
  S --> T[Lifecycle completed]
```

## Example Input

IDs are public example keys. They represent stable workflow references such as contact refs, form submissions, review records, or handoff keys.

```csv
lead_id,source_type,profile_ref,category_hint,contact_ref,notes
lead_001,public_directory,profile_alpha,automation_operator,contact_ref_001,Strong workflow systems signal
lead_002,event_list,profile_beta,growth_ops,contact_ref_002,Needs category confirmation
```

## Example Output

```json
{
  "batch_id": "lead_batch_001",
  "dedupe": {
    "status": "new"
  },
  "enrichment": {
    "status": "complete",
    "source_count": 3
  },
  "approved_snapshot": {
    "lead_id": "lead_001",
    "ai_analysis": {
      "fit_tier": "high",
      "confidence": 0.86
    },
    "human_review": {
      "status": "approved",
      "accepted_values": ["approved", "needs_edit", "rejected"]
    },
    "review_loop": {
      "status": "not_required",
      "rerun_allowed": true
    },
    "outbound_handoff": {
      "queued": true,
      "sender_mode": "manual_or_controlled",
      "cancel_before_handoff": false,
      "events_tracked": ["delivery", "reply", "reporting_sync"]
    }
  }
}
```

## What To Notice

- Approval creates a stable snapshot before outbound action.
- AI analysis supports human review instead of replacing it.
- Cancellation is modeled at handoff time, after review but before outbound action.
- Rerun, reply, and reporting paths are modeled separately from enrichment.

## Synthetic n8n Demo

- [n8n-demo/workflow.json](./n8n-demo/workflow.json): importable workflow
- [n8n-demo/sample-input.json](./n8n-demo/sample-input.json): mock lead intake payload
- [n8n-demo/sample-output.json](./n8n-demo/sample-output.json): mock approved handoff result
