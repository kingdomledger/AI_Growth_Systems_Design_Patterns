# Workflow Reliability & Error Handling

This synthetic example focuses on reliability patterns for API-connected automations: validation, idempotency, retries, incident logs, alerting, and replay.

## Workflow

1. Receive a webhook or manual test payload.
2. Validate required fields.
3. Build an idempotency key.
4. Check whether the event has already been processed.
5. Process the event or route duplicates safely.
6. Simulate an API failure branch when requested.
7. Capture incident details and alert payloads.
8. Replay after the cause is fixed.

## Design Notes

- Idempotency prevents duplicate side effects.
- Validation failures become operator-visible incidents.
- Retryable errors are separated from permanent failures.
- The demo n8n workflow is synthetic and uses mock data only.

## Files

- [diagram.mmd](./diagram.mmd): Mermaid reliability diagram
- [sample-payload.json](./sample-payload.json): synthetic incoming event
- [incident-log-example.json](./incident-log-example.json): synthetic incident record
- [n8n-demo](./n8n-demo): importable n8n demo workflow using mock data

## Sanitization

This example does not include production endpoints, workflow IDs, credential references, private schema names, internal dashboards, or real payloads.

