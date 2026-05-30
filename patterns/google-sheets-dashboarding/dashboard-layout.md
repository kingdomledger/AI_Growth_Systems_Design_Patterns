# Dashboard Layout

All data in this file is synthetic and created for demonstration purposes.

## Suggested Sections

- Queue summary
- Status breakdown
- Error summary
- Owner workload
- Stale records
- Recent changes
- Action items

## Example Formula Ideas

```text
Needs review count:
=COUNTIF(StatusRange, "Needs Review")

Error count:
=COUNTIF(StatusRange, "Error")

Stale item flag:
=IF(AND(Status="Needs Review", DaysOpen>3), "Stale", "")

Approval rate:
=ApprovedRecords / TotalRecords
```

