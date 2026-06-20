# Lead Enrichment & AI Review Queue

This synthetic example shows a growth operations workflow that turns rough public-source leads into review-ready records. It emphasizes enrichment, deduplication, AI-assisted classification, confidence flags, and human approval.

## Workflow

1. Import candidate leads from a public source list.
2. Normalize profile, company, and category fields.
3. Deduplicate against prior records.
4. Enrich with public context.
5. Run AI-assisted fit classification.
6. Route uncertain or high-value records to human review.
7. Export approved leads for downstream CRM or lifecycle workflows.

## Design Notes

- AI scoring is advisory, not autonomous approval.
- Low-confidence records are preserved for review instead of discarded silently.
- Deduplication uses stable keys so repeat imports do not create duplicate outreach records.
- The output is designed for handoff, not direct sending.

## Files

- [diagram.mmd](./diagram.mmd): Mermaid workflow diagram
- [sample-input.csv](./sample-input.csv): synthetic public-source leads
- [sample-output.json](./sample-output.json): synthetic enriched review queue

## Sanitization

This example does not include real creators, investors, handles, emails, target lists, campaign copy, private scoring prompts, or exact scoring formulas.

