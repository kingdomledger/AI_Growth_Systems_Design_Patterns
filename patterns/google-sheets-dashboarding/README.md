# Design Pattern: Google Sheets Dashboarding for Growth Ops

## Problem Class

Small teams often need lightweight visibility before they have a full analytics stack. A spreadsheet dashboard can help track queue status, QA issues, owners, and operational throughput.

## When This Pattern Is Useful

Use this pattern for review queues, intake workflows, campaign checklists, lifecycle operations, QA tracking, and weekly operating reviews.

## High-Level Workflow

1. Collect raw operational rows.
2. Clean and normalize key fields.
3. Add status, owner, and timestamp columns.
4. Create summary formulas.
5. Add QA flags.
6. Build a dashboard tab.
7. Review stale or failed items regularly.

## Example Synthetic Scenario

A team tracks synthetic workflow records across statuses such as `Needs Review`, `Approved`, `Archived`, and `Error`. A dashboard summarizes queue size, error count, and stale items.

All data in this file is synthetic and created for demonstration purposes.

See [sample-kpis.csv](sample-kpis.csv).

## Data Inputs

- Record ID
- Status
- Owner
- Created date
- Updated date
- Error reason
- Review notes

## Processing Logic

Use formulas to count records by status, flag stale items, calculate review age, and summarize owners. Keep raw rows separate from dashboard views so the system remains easy to audit.

## Human-in-the-Loop Controls

- Owners review stale items.
- Error rows require notes before closure.
- Dashboard changes are documented.
- Manual overrides are visible.

## Dashboard / Reporting Layer

Track total records, status counts, stale review items, error count, owner workload, approval rate, and unresolved exceptions.

## Tradeoffs

- Spreadsheets are fast and accessible but easier to break.
- Manual review is transparent but requires discipline.
- Formula dashboards are flexible but can become fragile.
- Lightweight tools are useful early, but may need migration later.

## Failure Modes

- Formula ranges break.
- Manual edits overwrite calculated fields.
- Owners ignore stale items.
- Dashboard tabs drift away from raw data.
- Too many statuses make the workflow confusing.

## Tools That Could Be Used

Google Sheets, Airtable, N8N, APIs, LLMs, Postgres, CRM tools, and lightweight dashboard tools.

## What This Demonstrates

- Spreadsheet operations design
- KPI modeling
- QA flagging
- Dashboard layout thinking
- Operational review habits

