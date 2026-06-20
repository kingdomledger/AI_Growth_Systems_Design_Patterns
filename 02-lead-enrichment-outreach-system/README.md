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
  B --> C[Contact validation]
  C --> D[Public-source enrichment]
  D --> E[AI-assisted analysis]
  E --> F[Draft or recommendation generation]
  F --> G{Human gate}
  G -- Needs edit --> H[Operator edits or rerun]
  G -- Reject --> I[Archive with reason]
  G -- Approve --> J[Immutable approval snapshot]
  H --> E
  J --> K[Idempotent outbound handoff]
  K --> L[Outbound queue]
  L --> M[Manual or controlled sender]
  M --> N[Delivery and reply events]
  N --> O[Reporting sync]
  L --> P[Cancellation control]
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
  "approved_snapshot": {
    "lead_id": "lead_001",
    "dedupe_status": "new",
    "enrichment_status": "complete",
    "ai_analysis": {
      "fit_tier": "high",
      "confidence": 0.86
    },
    "human_gate": {
      "status": "approved"
    },
    "outbound_handoff": {
      "queued": true,
      "sender_mode": "manual_or_controlled"
    }
  }
}
```

## What To Notice

- Approval creates a stable snapshot before outbound action.
- AI analysis supports the review gate instead of replacing it.
- Cancellation, rerun, reply, and reporting paths are modeled separately from enrichment.

## Synthetic n8n Demo

- [n8n-demo/workflow.json](./n8n-demo/workflow.json): importable workflow
- [n8n-demo/sample-input.json](./n8n-demo/sample-input.json): mock lead intake payload
- [n8n-demo/sample-output.json](./n8n-demo/sample-output.json): mock approved handoff result
