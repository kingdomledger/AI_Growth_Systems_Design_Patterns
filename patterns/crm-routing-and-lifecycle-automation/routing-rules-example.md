# Routing Rules Example

All data in this file is synthetic and created for demonstration purposes.

```text
If email is missing:
  route to invalid queue

If consent flag is false:
  route to manual review

If duplicate confidence is high:
  update existing CRM-ready record

If duplicate confidence is medium:
  route to manual review

If required fields are present and no duplicate is found:
  route to CRM-ready queue
```

