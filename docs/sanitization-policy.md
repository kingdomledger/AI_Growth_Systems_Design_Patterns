# Sanitization Policy

This portfolio shows public-safe versions of real workflow patterns. It is designed to prove systems thinking without exposing private implementation details.

## Never Include

- Employer, client, or current company names
- Real users, leads, investors, applicants, customers, or target lists
- Real emails, private profile URLs, wallet addresses, or internal identifiers
- API keys, access tokens, credentials, bearer strings, cookies, or sessions
- `.env` files, browser state, dashboards, private endpoints, or webhook URLs
- Raw workflow exports from real workspaces
- Exact database schemas, private prompts, campaign logic, or internal metrics
- Production screenshots, PDFs, zips, certificates, spreadsheets, images, videos, or generated outputs

## Sanitization Rule

Convert specifics one level up.

| Specific | Public-safe abstraction |
|---|---|
| Named form provider | Form intake |
| Named workflow workspace | Workflow orchestrator |
| Exact spreadsheet or table ID | Operational spreadsheet or database |
| Exact CRM/list ID | CRM or lifecycle upsert |
| Production webhook path | Webhook event |
| Exact scoring prompt | AI-assisted classification or scoring layer |
| Real target list | Synthetic public-source input |
| Real outreach campaign | General outbound handoff |

## Claim Standard

Use: "sanitized case study based on real workflow-building experience."

Avoid: "production export," "client system," "live workflow," or "real campaign data."

