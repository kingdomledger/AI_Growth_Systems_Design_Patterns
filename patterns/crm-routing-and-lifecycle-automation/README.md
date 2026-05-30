# Design Pattern: Intake Form to CRM Lifecycle Routing

## Problem Class

Form submissions often arrive with inconsistent formatting, duplicate contacts, missing fields, and unclear lifecycle status. Teams need a reliable way to clean, route, and track records before they enter a CRM or operations queue.

## When This Pattern Is Useful

Use this pattern for demo webinar signups, mock partner applications, synthetic event registrations, waitlists, contact forms, or internal request queues.

## High-Level Workflow

1. Receive form submission.
2. Validate required fields.
3. Normalize email, name, organization, and source.
4. Check for duplicate records.
5. Assign lifecycle status.
6. Route to CRM, review queue, or rejection log.
7. Track status, owner, timestamp, and errors.

## Example Synthetic Scenario

A demo webinar signup form sends records into a routing workflow. Qualified records move to a CRM-ready queue, ambiguous records go to manual review, and invalid records are archived with a reason.

All data in this file is synthetic and created for demonstration purposes.

See [mock-crm-fields.csv](mock-crm-fields.csv).

## Data Inputs

- Submission ID
- Submitted timestamp
- Name
- Email
- Organization
- Source
- Consent flag
- Interest category

## Processing Logic

Validate the minimum required fields, normalize contact details, deduplicate by stable keys, assign lifecycle status, and record the routing reason. The workflow should be idempotent so repeated submissions do not create unnecessary duplicate records.

## Human-in-the-Loop Controls

- Ambiguous duplicates go to manual review.
- Missing consent or unclear status blocks automated routing.
- Reviewers can update lifecycle state with notes.
- Failed syncs are logged rather than silently ignored.

## Dashboard / Reporting Layer

Track new submissions, routed records, duplicate rate, review backlog, invalid records, sync failures, and average time in review.

## Tradeoffs

- Strict validation improves data quality but may reject borderline records.
- Flexible matching catches more duplicates but increases false merges.
- Spreadsheet review is accessible but can become messy at scale.
- CRM automation saves time but needs strong status tracking.

## Failure Modes

- Duplicate contacts are created.
- Valid records are rejected due to strict validation.
- Review queues have no owner.
- Failed CRM syncs go unnoticed.
- Lifecycle statuses become inconsistent across tools.

## Tools That Could Be Used

Google Forms, Typeform-like form tools, N8N, APIs, Google Sheets, Airtable, Postgres, and CRM tools.

## What This Demonstrates

- CRM routing architecture
- Lifecycle state management
- Deduplication and validation
- Error handling
- Operations-friendly workflow design

