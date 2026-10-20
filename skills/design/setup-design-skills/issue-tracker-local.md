# Issue tracker: Local Markdown

Briefs, parked questions and tickets for this product live as markdown files in `briefs/` in the design folder.

## Conventions

- The brief is `briefs/<brief-slug>.md`, with `Status: design-brief` near the top
- The PRD snapshot sits beside it at `briefs/<brief-slug>-prd.md`
- Parked questions are one file per question at `briefs/<brief-slug>/questions/<NN>-<slug>.md`, numbered from `01`
- Tickets are one file per ticket at `briefs/<brief-slug>/tickets/<NN>-<slug>.md`, numbered from `01` in dependency order, never a single combined tickets file
- State is recorded as a `Status:` line near the top of each file (see `labels.md` for the role strings), plus `closed` once settled
- Comments and conversation history append to the bottom of the file under a `## Comments` heading

## When a skill says "publish to the issue tracker"

Create a new file under `briefs/` (creating the directory if needed).

## When a skill says "fetch the relevant ticket"

Read the file at the referenced path. The user will normally pass the path or the ticket number directly.

## Brief operations

- **Parked question**: `Status: needs-alignment`, the question as the title. When your team answers, append it under an `## Answer` heading and set `Status: closed`. Open means waiting on the PM; closed means settled.
- **Ticket**: `Status: ready-for-agent` (or `ready-for-human`); `ready-for-review` once designed and waiting for the user.
- **Blocking**: a `Blocked by: NN, NN` line near the top. A ticket is unblocked when every ticket it lists is `closed`.
