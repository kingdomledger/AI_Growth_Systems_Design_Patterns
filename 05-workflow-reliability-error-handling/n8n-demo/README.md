# Synthetic n8n Demo: Workflow Reliability & Error Handling

This is a synthetic n8n workflow built for the public portfolio. It demonstrates workflow reliability patterns without copying private exports, endpoints, schemas, provider names, payloads, execution logs, or production infrastructure.

## What It Shows

- Manual/webhook-style event intake
- Payload validation before side effects
- Idempotency key construction
- Duplicate detection branch
- Retryable vs permanent failure routing
- Incident record and alert stubs
- Replay/recovery path after operator review

## How To Use

1. Import `workflow.json` into a clean n8n workspace.
2. Do not add credentials.
3. Use `sample-payload.json` as the mock event reference.
4. Run from the manual trigger or inspect the canvas.
5. Screenshot only the workflow canvas if creating a public image.

All endpoints use `https://example.invalid/...` and are disabled stubs.
