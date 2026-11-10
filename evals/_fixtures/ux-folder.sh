#!/usr/bin/env bash
# Shared fixture: a small product's UX folder, with a local markdown tracker.
# A case's fixture.sh sources this file, then adds what that case needs.
set -euo pipefail

mkdir -p docs/ux/personas docs/ux/briefs

cat > docs/ux/config.md <<'MD'
# UX config

## Product

- **Product**: Fieldnote
- **UX folder**: `docs/ux/`
- **Design system docs**: none

## In this folder

- **`FIGMA_STANDARDS.md`**: the project's Figma rules.
- **`glossary.md`**: the product's own words. Use them in every brief, ticket, frame name and piece of copy.
- **`personas/`**: one file per persona, plus `index.md` with one line each.
- **`briefs/`**: briefs, PRD snapshots, questions and tickets. The issue tracker is local markdown.
MD

cat > docs/ux/issue-tracker.md <<'MD'
# Issue tracker: Local Markdown

Briefs, parked questions and tickets for this product live as markdown files in `briefs/` in the UX folder.

- The brief is `briefs/<brief-slug>.md`, with `Status: ux-brief` near the top
- The PRD snapshot sits beside it at `briefs/<brief-slug>-prd.md`
- Parked questions are one file per question at `briefs/<brief-slug>/questions/<NN>-<slug>.md`
- Tickets are one file per ticket at `briefs/<brief-slug>/tickets/<NN>-<slug>.md`, numbered from `01` in dependency order
- State is a `Status:` line near the top of each file, plus `closed` once settled
- A closed question holds its answer under an `## Answer` heading
- Blocking is a `Blocked by: NN, NN` line near the top
MD

cat > docs/ux/labels.md <<'MD'
# Labels

| Role | Label in our tracker |
| --- | --- |
| `ux-brief` | `ux-brief` |
| `needs-alignment` | `needs-alignment` |
| `ready-for-ux-agent` | `ready-for-ux-agent` |
| `ready-for-designer` | `ready-for-designer` |
| `ready-for-designer-review` | `ready-for-designer-review` |
MD

cat > docs/ux/glossary.md <<'MD'
# Glossary

**Workspace**:
The shared space a team works in.
_Avoid_: Organization, org, account

**Invite**:
A request for one person to join a workspace, sent by email.
_Avoid_: Invitation link
MD

cat > docs/ux/personas/index.md <<'MD'
# Personas

- [Workspace admin](workspace-admin.md): runs a team's workspace and decides who is in it.
- [Field tech](field-tech.md): works on site from a phone and joins workspaces others set up.
MD

cat > docs/ux/personas/workspace-admin.md <<'MD'
# Workspace admin

Runs a team's workspace from a desk and decides who is in it.

## Goals

- Get a new hire working on day one.

## Accessibility needs

- Unknown
MD

cat > docs/ux/personas/field-tech.md <<'MD'
# Field tech

Works on site from a phone, often with gloves on and poor signal.

## Goals

- Join the right workspace without calling the office.

## Accessibility needs

- Large touch targets, readable in bright light
MD
