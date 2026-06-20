# Sanitization Policy

This portfolio uses synthetic examples and generalized architecture. It is designed to show workflow thinking without exposing private implementation details.

## Never Include

- Employer, client, or current company names
- Real users, creators, investors, customers, leads, or target lists
- Real emails, wallet addresses, private profile URLs, or internal identifiers
- API keys, access tokens, credentials, bearer strings, cookies, or sessions
- `.env` files, browser state, dashboards, private endpoints, or webhook URLs
- Raw workflow exports from real workspaces
- Exact database schemas, private prompts, campaign logic, or internal metrics
- Production screenshots, PDFs, zips, certificates, spreadsheets, images, videos, or generated outputs

## Sanitization Rule

Convert specifics one level up.

Specific implementation details become public-safe architecture labels:

| Specific | Public-safe abstraction |
|---|---|
| Named form provider | Form intake |
| Named workflow workspace | Workflow orchestrator |
| Exact sheet/table ID | Operational spreadsheet or database |
| Exact CRM/list ID | CRM upsert |
| Production webhook path | Webhook event |
| Exact scoring prompt | AI-assisted classification layer |
| Real target list | Synthetic public-source input |

## Public Claim Standard

Use wording like: "sanitized and synthetic example based on workflow-building experience."

Avoid wording like: "production export," "live workflow," "client system," or "real campaign data."

