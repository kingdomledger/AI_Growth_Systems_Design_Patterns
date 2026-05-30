# AI Growth Systems Design Patterns

This repository contains generalized design patterns and synthetic examples for AI-assisted growth operations, automation, CRM workflows, lead enrichment, dashboarding, and human-in-the-loop review systems.

The purpose of this repo is to demonstrate how I reason through growth systems: problem framing, workflow design, tradeoffs, failure modes, and implementation patterns.

These examples are independently written, educational, and synthetic. They are not copied from any employer system, client project, internal workflow, proprietary strategy, source code, dataset, prompt, dashboard, or operating playbook.

This repository does not contain confidential information, company names, customer/user records, credentials, API endpoints, internal metrics, workflow exports, screenshots, private prompts, or non-public strategy.

## Patterns

| Pattern | Focus |
| --- | --- |
| [Multi-Stage Lead Enrichment & Review Queues](patterns/multi-stage-lead-enrichment/README.md) | Turning public-source lead inputs into structured review queues |
| [LLM-Assisted Review & Classification](patterns/llm-assisted-review-and-classification/README.md) | Using LLMs to support structured review while keeping humans accountable |
| [Intake Form to CRM Lifecycle Routing](patterns/crm-routing-and-lifecycle-automation/README.md) | Cleaning, deduplicating, routing, and tracking form submissions |
| [Email Deliverability Monitoring & Sender Health](patterns/email-deliverability-monitoring/README.md) | Monitoring authentication, hygiene, sender health, and campaign signals |
| [Google Sheets Dashboarding for Growth Ops](patterns/google-sheets-dashboarding/README.md) | Building lightweight operational dashboards from synthetic workflow data |
| [Human-in-the-Loop Operations](patterns/human-in-the-loop-ops/README.md) | Designing approval gates, QA loops, escalation paths, and audit trails |

## Docs

- [Public Safety Policy](docs/public-safety-policy.md)
- [Portfolio Positioning](docs/portfolio-positioning.md)

## System Recipes

Patterns are reusable building blocks. System recipes show how multiple patterns can be combined into a larger workflow.

| Recipe | Patterns combined |
| --- | --- |
| [Lead-to-CRM Review System](system-recipes/lead-to-crm-review-system/README.md) | Lead enrichment, LLM-assisted review, CRM routing, dashboarding, human review |
| [Content Ops Review System](system-recipes/content-ops-review-system/README.md) | LLM-assisted classification, human-in-the-loop QA, dashboarding |
| [Email Health Ops System](system-recipes/email-health-ops-system/README.md) | Deliverability monitoring, dashboarding, human review, lifecycle operations |

## How to Read This Repo

Each pattern follows the same structure: problem class, use cases, workflow, synthetic scenario, data inputs, processing logic, human controls, reporting, tradeoffs, failure modes, possible tools, and demonstrated skills.

The emphasis is methodology, not disclosure. The examples are intentionally generic so they can be reviewed publicly without exposing private operations or employer-owned material.
