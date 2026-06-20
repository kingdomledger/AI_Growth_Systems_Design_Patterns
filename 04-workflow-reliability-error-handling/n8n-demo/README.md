# n8n Demo: Workflow Reliability & Error Handling

This folder contains a recreated synthetic n8n workflow for portfolio screenshots and local testing. It is not copied from any production export.

## What It Demonstrates

- Manual trigger with mock payload
- Payload validation
- Idempotency key generation
- Duplicate-safe branching
- Simulated processing success and failure
- Incident log output
- Replay-ready response fields

## How To Use

1. Import [workflow.json](./workflow.json) into a clean n8n workspace.
2. Open the workflow and run it manually.
3. Change `simulate_failure` in the mock payload node to test the incident path.
4. Take a screenshot of the workflow canvas or execution result for the portfolio.

## Safety

The workflow uses synthetic data, fake endpoint labels, and no credentials. It does not call a real external API.

