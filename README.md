# AI Growth & Workflow Systems Portfolio

I build AI-assisted operational systems for onboarding, lead enrichment, research agents, outreach workflows, and reliability.

This repo is a sanitized proof-of-work portfolio. The examples are based on real workflow-building experience, but every artifact uses synthetic data, generalized system names, mock inputs, and public-safe architecture.

## Start Here

| System | What it proves | Link |
|---|---|---|
| Member Onboarding Automation | Intake, review decisions, access provisioning, override/repair paths, synthetic n8n demo | [01-member-onboarding-automation](./01-member-onboarding-automation) |
| Lead Enrichment & Outreach System | Enrichment, AI analysis, human review, outbound handoff, synthetic n8n demo | [02-lead-enrichment-outreach-system](./02-lead-enrichment-outreach-system) |
| Investor Lead Gen Agent | Python CLI agent for sourcing, scoring, and review exports | [03-investor-lead-gen-agent](./03-investor-lead-gen-agent) |
| Profile Research Agent | Structured AI extraction from public profile/research inputs | [04-profile-research-agent](./04-profile-research-agent) |
| Reliability & Error Handling | Dedupe, idempotency, retries, incident logs, replay, synthetic n8n demo | [05-workflow-reliability-error-handling](./05-workflow-reliability-error-handling) |

## Best First Clicks For Recruiters

Start with [05-workflow-reliability-error-handling](./05-workflow-reliability-error-handling), then [02-lead-enrichment-outreach-system](./02-lead-enrichment-outreach-system), then [03-investor-lead-gen-agent](./03-investor-lead-gen-agent). These show reliability thinking, workflow orchestration, AI-assisted review, and agentic research.

The n8n demos are synthetic workflows built only for this portfolio. They demonstrate how I think about workflow architecture without exposing real company systems.

Each case study is README-first: the architecture diagram and compact example input/output are embedded directly in the folder README. The `n8n-demo/` subfolders are practical importable examples for the three workflow-orchestration case studies.

## What This Shows

- I can turn messy operational processes into repeatable workflows.
- I can design AI-assisted systems with human review instead of blind automation.
- I can connect intake, enrichment, databases, review queues, outbound handoff, and reporting.
- I think about operational reliability: reruns, cached failures, idempotent handoffs, cancellation, incident records, and sync repair.

## What Is Sanitized

The repo does not include raw workflow exports, real company names, real users, real leads, real investors, private prompts, credentials, internal dashboards, production screenshots, or exact database schemas.

The examples are intentionally generalized one level up so they are safe to share and easy to understand.

## Tools And Concepts Represented

- n8n-style and Make-style workflow orchestration
- Webhooks, APIs, operational spreadsheets, databases, and CRM/lifecycle handoffs
- LLM extraction, scoring, confidence flags, validation, and human review
- Dedupe, retryability, idempotency, incident logs, cancellation controls, and replay paths
