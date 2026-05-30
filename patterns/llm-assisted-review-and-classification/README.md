# Design Pattern: LLM-Assisted Review & Classification

## Problem Class

Teams often need to classify messy text, profiles, tickets, or notes into structured categories. LLMs can accelerate this work, but they should not become the final decision-maker for high-impact or ambiguous cases.

## When This Pattern Is Useful

Use this pattern when inputs require judgment, summarization, categorization, or risk flagging, and when final decisions still need human accountability.

## High-Level Workflow

1. Normalize the input record.
2. Send only necessary context to an LLM.
3. Ask for structured output with labels and reasoning.
4. Assign a confidence level.
5. Route low-confidence or high-risk records to human review.
6. Capture reviewer decisions.
7. Use review outcomes to improve future instructions and QA checks.

## Example Synthetic Scenario

A team receives public profile summaries and wants to classify each record into generic fit categories. The LLM suggests a category, confidence level, and short rationale. A reviewer confirms or overrides the classification.

All data in this file is synthetic and created for demonstration purposes.

See [synthetic-examples.json](synthetic-examples.json).

## Data Inputs

- Public summary text
- Category options
- Allowed labels
- Review status
- Optional reviewer notes

## Processing Logic

The LLM should return structured JSON with a label, confidence level, short rationale, and flags for uncertainty. Avoid hidden scoring rules that reviewers cannot inspect.

## Human-in-the-Loop Controls

- Humans review low-confidence outputs.
- Humans review records with risk flags.
- Reviewers can override labels and add notes.
- QA samples should be checked regularly for false positives and false negatives.

## Dashboard / Reporting Layer

Track classification volume, override rate, low-confidence rate, unresolved review items, common error types, and QA sample outcomes.

## Tradeoffs

- More context can improve classification but may increase cost and privacy risk.
- Strict schemas improve consistency but may lose nuance.
- Human review improves quality but limits speed.
- Confidence labels are useful only if tested against reviewer outcomes.

## Failure Modes

- The model overstates confidence.
- Ambiguous cases are incorrectly auto-approved.
- Labels drift over time.
- Reviewers do not understand the classification rationale.
- QA samples are too small or too easy.

## Tools That Could Be Used

LLMs, Google Sheets, Airtable, N8N, APIs, Postgres, CRM tools, or a lightweight review app.

## What This Demonstrates

- Prompt design principles without exposing prompts
- Structured classification
- QA workflow design
- False positive control
- Human review architecture

