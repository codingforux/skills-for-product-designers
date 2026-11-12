---
type: llm
focus: last_message
---

The reply lists design tickets split from a brief about inviting people to a workspace.

PASS if all of these hold:
- Ticket 01 is the main path end to end: an admin invites one person and that person joins. Nothing blocks it.
- Every later ticket is one more path a user can take (for example inviting several people, managing pending invites, an expired invite).
- User stories 1 to 5 are each covered by some ticket.

FAIL if any ticket is a horizontal layer across the brief (for example "all error states", "wireframes", "visual polish"), if ticket 01 is blocked by another ticket, or if a user story from 1 to 5 is covered by no ticket.
