#!/usr/bin/env bash
# Seeds the workspace: the shared UX folder, a PRD snapshot and one answered question.
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_fixtures/ux-folder.sh"

mkdir -p docs/ux/briefs/team-invites/questions

cat > docs/ux/briefs/team-invites-prd.md <<'MD'
# PRD: Team invites (snapshot)

Marks from grill-prd: **yours**, **needs alignment**, **not yours**.

## Background

Today an admin adds people to their organization by emailing support. It takes two days, and new hires can't work until it's done.

## What we're building

1. **yours** An admin can invite people to the organization by email, one or several at a time.
2. **yours** The invited person gets an email and can join from their phone.
3. **yours** An admin can see pending invites and cancel or resend one.
4. **needs alignment** Invites expire. (How long? See question 01.)
5. **not yours** The email is sent through the existing notification service. Engineering owns the template plumbing.

## Success

New hires are working in the organization the same day in 80% of cases, measured by time from invite sent to first sign-in.

## Not this release

- Single sign-on. Legal review of the identity provider contract isn't finished.
- Inviting people to more than one organization at once.

## Limits

- Phones first for the invited person: field techs join from a phone on site.
- Must reuse the existing sign-in screens.
MD

cat > docs/ux/briefs/team-invites.md <<'MD'
# Team invites

Status: ux-brief

Source: briefs/team-invites-prd.md
MD

cat > docs/ux/briefs/team-invites/questions/01-how-long-do-invites-last.md <<'MD'
# How long do invites last before they expire?

Status: closed

The PRD says invites expire but not when.

## Answer

Invites expire after 7 days. An expired invite can be resent by an admin, which starts a new 7 days. (Product manager, by email.)
MD
