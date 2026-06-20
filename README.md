# AI Growth & Workflow Systems Portfolio

I build AI-assisted operational systems for onboarding, lead enrichment, research agents, outreach workflows, and reliability.

This repo is a proof-of-work portfolio based on real workflow-building experience.

All examples are synthetic and public-safe; no private workflow exports, real data, credentials, screenshots, or proprietary schemas are included.

## Start Here

| System | What it proves | Link |
|---|---|---|
| Member Onboarding Automation | Intake, review decisions, access provisioning, override/repair paths, n8n demo | [01-member-onboarding-automation](./01-member-onboarding-automation) |
| Lead Enrichment & Outreach System | Enrichment, AI analysis, human review, outbound handoff, n8n demo | [02-lead-enrichment-outreach-system](./02-lead-enrichment-outreach-system) |
| Investor Lead Gen Agent | Python CLI agent for sourcing, scoring, and review exports | [03-investor-lead-gen-agent](./03-investor-lead-gen-agent) |
| Profile Research Agent | Structured AI extraction from public profile/research inputs | [04-profile-research-agent](./04-profile-research-agent) |
| Reliability & Error Handling | Dedupe, idempotency, retries, incident logs, replay, n8n demo | [05-workflow-reliability-error-handling](./05-workflow-reliability-error-handling) |

## Best First Clicks For Recruiters

Start with [05-workflow-reliability-error-handling](./05-workflow-reliability-error-handling), then [02-lead-enrichment-outreach-system](./02-lead-enrichment-outreach-system), then [03-investor-lead-gen-agent](./03-investor-lead-gen-agent). These show reliability thinking, workflow orchestration, AI-assisted review, and agentic research.

The n8n demos are portfolio workflows built to show how I think about workflow architecture.

Each case study is README-first: the architecture diagram and compact example input/output are embedded directly in the folder README. The `n8n-demo/` subfolders are practical importable examples for the three workflow-orchestration case studies.

## Working Patterns

- Messy intake and review processes turned into repeatable workflows
- AI-assisted analysis with human approval before downstream action
- Handoffs across intake, enrichment, databases, review queues, outbound workflows, and reporting
- Reliability patterns for reruns, cached failures, idempotent handoffs, cancellation, incident records, and sync repair

## Tools And Concepts Represented

- n8n-style and Make-style workflow orchestration
- Webhooks, APIs, operational spreadsheets, databases, and CRM/lifecycle handoffs
- LLM extraction, scoring, confidence flags, validation, and human review
- Dedupe, retryability, idempotency, incident logs, cancellation controls, and replay paths
