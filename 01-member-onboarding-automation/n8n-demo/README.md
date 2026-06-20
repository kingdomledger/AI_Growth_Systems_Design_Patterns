# Synthetic n8n Demo: Member Onboarding Automation

This is a synthetic n8n workflow built for the public portfolio. It demonstrates the same operating principles as past onboarding automation work without copying private workflow exports, schemas, endpoints, provider names, access rules, or production data.

## What It Shows

- Manual/form-style intake with mock application data
- Normalization before review
- Duplicate and prior-status checks
- Decision routing for approve, reject, revoke, and admin override
- Provisioning and notification stubs using fake endpoints
- Repair queue and completed audit output

## How To Use

1. Import `workflow.json` into a clean n8n workspace.
2. Do not add credentials.
3. Open the canvas and use the included `sample-input.json` as the mock payload reference.
4. Capture only the workflow canvas if creating a public screenshot.

All endpoints use `https://example.invalid/...` and are not intended to call real services.
