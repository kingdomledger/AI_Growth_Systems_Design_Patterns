# Prompt Design Principles

All examples in this file are synthetic and created for demonstration purposes.

- Ask for structured output rather than freeform prose.
- Require short reasoning so reviewers can inspect the classification.
- Include an `uncertainty_reason` field for ambiguous inputs.
- Limit allowed labels to a controlled list.
- Route low-confidence outputs to human review.
- Track reviewer overrides to identify label drift.
- Avoid placing sensitive or unnecessary information into model context.

