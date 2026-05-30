# Design Pattern: Multi-Stage Lead Enrichment & Review Queues

## Problem Class

Growth teams often receive messy public-source lead inputs: incomplete names, duplicate records, unclear fit, missing context, and inconsistent source quality. The challenge is turning those inputs into structured records that can be reviewed, prioritized, and routed.

## When This Pattern Is Useful

Use this pattern when a team needs to qualify public-source leads before CRM entry, outreach planning, partnership review, or manual research follow-up.

## High-Level Workflow

1. Collect public-source lead inputs.
2. Normalize names, URLs, categories, and locations.
3. Deduplicate records using stable matching keys.
4. Enrich each record with short public-signal summaries.
5. Assign a simple fit band and confidence level.
6. Route records into a human review queue.
7. Export approved records to a CRM-ready format.

## Example Synthetic Scenario

A marketplace team is reviewing publicly available organization profiles to identify possible partners. The team wants a queue that separates strong-fit, possible-fit, and low-fit records before any follow-up action.

All data in this file is synthetic and created for demonstration purposes.

See [example-review-queue.csv](example-review-queue.csv).

## Data Inputs

- Public profile URL
- Organization name
- Category
- Location
- Source label
- Short public notes
- Last observed activity signal

## Processing Logic

Normalize each record, remove obvious duplicates, create a short public-signal summary, assign a fit band, and add a review status. The scoring logic should stay simple and inspectable so reviewers can understand why a record was prioritized.

## Human-in-the-Loop Controls

- Reviewers approve, archive, or request more research.
- Ambiguous records stay out of downstream systems until reviewed.
- Risk notes remain visible beside fit labels.
- Low-confidence classifications are routed for manual inspection.

## Dashboard / Reporting Layer

Track generic KPIs such as records reviewed, records approved, duplicates found, low-confidence records, unresolved review items, and stale queue items.

## Tradeoffs

- More enrichment improves context but increases cost and review time.
- Simple fit bands are easier to audit but less nuanced.
- Deduplication reduces noise but may incorrectly merge similar records.
- Human review protects quality but slows throughput.

## Failure Modes

- Duplicate records enter the CRM.
- Fit labels become too opaque for reviewers.
- Public-source data is stale or incomplete.
- Review queues grow without ownership.
- Automation over-prioritizes records with polished public profiles.

## Tools That Could Be Used

Google Sheets, N8N, Airtable, APIs, LLMs, Postgres, CRM tools, or a lightweight Python script.

## What This Demonstrates

- Lead enrichment architecture
- Deduplication thinking
- Review queue design
- Human-in-the-loop prioritization
- Synthetic data modeling

