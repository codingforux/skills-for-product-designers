---
type: llm
focus: last_message
---

PASS if the reply tells the user that the first skill to run on the PRD is grill-prd (written as `grill-prd` or `/grill-prd`).
FAIL if it names a different skill as the first step, lists several skills without saying which comes first, or never names grill-prd.
