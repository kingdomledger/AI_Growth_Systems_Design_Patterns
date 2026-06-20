# Investor Lead Gen Agent

Sanitized case study based on a local Python CLI agent for sourcing, enriching, scoring, and exporting investor leads for human review.

## What This Is Based On

- Local Python CLI workflow
- Company profile builder from private input documents
- Dynamic ICP question flow
- Investor candidate sourcing from input lists and public pages
- Deduplication against local JSON state
- Public page scraping and evidence collection
- LLM extraction and scoring
- Ranked review CSV/JSON export

## What It Demonstrates

- Agentic workflow design beyond visual automation tools
- Structured state management across sourcing, enrichment, scoring, and export
- LLM-assisted research extraction with evidence links
- Deduplication and freshness checks
- Human-review outputs instead of direct outreach automation

## How It Works

1. The operator provides company context and source inputs.
2. The agent builds a structured company profile.
3. The agent asks ICP questions and saves normalized criteria.
4. Candidate leads are sourced from input lists, source pages, or optional search routes.
5. Candidates are deduped before enrichment.
6. Public pages are scraped and evidence is collected.
7. LLM extraction creates structured research records.
8. Scoring ranks candidates against the company profile and ICP.
9. The agent exports a review CSV and audit JSON for human review.

## What Was Sanitized

This example removes real investor names, source URLs, company documents, actual outputs, confidential fundraising context, API keys, private scoring prompts, and generated lead data.

## What To Notice

This is the most technical case study in the repo. It shows a stateful Python agent workflow with sourcing, scraping, LLM extraction, scoring, reset controls, and review exports.

## Files

- [diagram.mmd](./diagram.mmd): workflow map
- [sample-input.json](./sample-input.json): synthetic agent run request
- [sample-output.json](./sample-output.json): synthetic ranked review output

