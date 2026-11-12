#!/usr/bin/env bash
# Seeds the workspace: the shared UX folder and a finished brief to split.
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_fixtures/ux-folder.sh"

cat > docs/ux/briefs/team-invites.md <<'MD'
# Team invites

Status: ux-brief

Source: briefs/team-invites-prd.md

## Problem

A workspace admin adds people by emailing support. It takes two days, and a new hire can't work until it's done.

## Goals and Success Metrics

New hires are working in the workspace the same day in 80% of cases. Signal: time from invite sent to first sign-in.

## Users

- Workspace admin: get a new hire working on day one.
- Field tech: join the right workspace without calling the office.

## User Stories

1. As a workspace admin, I want to invite one person by email, so that they can start work today
   - The invite is sent from the People screen in two steps or fewer
2. As a field tech, I want to join from the invite email on my phone, so that I don't need a desk
   - Joining lands on the existing sign-in screens
3. As a workspace admin, I want to invite several people at once, so that a new crew starts together
   - A wrong address is flagged without losing the others
4. As a workspace admin, I want to see pending invites and cancel or resend one, so that I can fix a mistake
5. As a field tech, I want to know what to do when my invite has expired, so that I'm not stuck on site
   - The expired screen says who to ask

## Requirements

### Functional

R1. An invite expires after 7 days; resending starts a new 7 days
R2. The words "organization" and "invitation link" appear nowhere

### Non-functional

N1. The invited person's screens are designed for phones first
N2. Reuses the existing sign-in screens

## Design Scope

PRD items 1 to 4. For the rest, see the PRD snapshot.

## Out of Scope

- Single sign-on: the legal review isn't finished.

## Open Questions

None.
MD
