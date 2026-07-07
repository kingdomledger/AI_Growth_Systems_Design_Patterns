# Synthetic n8n Demo

This demo workflow is public-safe and intentionally synthetic.

It demonstrates how a workflow can orchestrate a SQL-backed identity and review pipeline without exposing private source systems, production credentials, real leads, or private model prompts.

## What the workflow shows

- SQL source queue staging
- identifier normalization
- strong vs weak identifier separation
- SQL identity registry lookup
- conflict-safe dedupe path
- local enrichment API adapter boundary
- human review gate
- SQL export-state check
- duplicate-safe downstream handoff
- operational health-check summary

## Import instructions

1. Import [`workflow.json`](./workflow.json) into n8n.
2. Keep the workflow inactive.
3. Open the canvas and check the sticky-note lanes.
4. Take a clean screenshot of the full workflow.
5. Save it as:

```text
06-creator-lead-identity-review-pipeline/n8n-demo/n8n-workflow-snapshot.png
```

Do not include browser chrome, sidebars, workspace names, execution data panels, credentials, or real data in the screenshot.

## Files

- [`workflow.json`](./workflow.json): importable synthetic workflow
- [`sample-input.json`](./sample-input.json): mock source queue input
- [`sample-output.json`](./sample-output.json): mock lifecycle output

## Video Walkthrough 

- https://www.loom.com/share/e119cb13fd9f4e7f9d587ed3d2616882
