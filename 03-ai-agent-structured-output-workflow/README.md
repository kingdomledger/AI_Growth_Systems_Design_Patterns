# AI Agent Structured Output Workflow

This synthetic example shows an AI-assisted research agent that converts unstructured research input into validated JSON for human review.

## Workflow

1. Receive a research request and source references.
2. Extract relevant facts using an LLM.
3. Return structured JSON with evidence notes and confidence.
4. Validate required fields and enum values.
5. Route missing or low-confidence fields to human review.
6. Produce a final approved record for downstream use.

## Design Notes

- The agent output is constrained to a predictable schema.
- Validation catches malformed or incomplete responses before handoff.
- Confidence and missing fields are visible to the reviewer.
- Final output is separated from raw model output.

## Files

- [diagram.mmd](./diagram.mmd): Mermaid workflow diagram
- [sample-input.json](./sample-input.json): synthetic research request
- [sample-output.json](./sample-output.json): synthetic structured output

## Sanitization

This example does not include browser session details, real profile lists, raw model responses, exact private prompts, real names, or proprietary research logic.

